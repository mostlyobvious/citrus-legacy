require 'mongrel2'
require 'webmachine/version'
require 'webmachine/headers'
require 'webmachine/request'
require 'webmachine/response'
require 'webmachine/dispatcher'
require 'webmachine/chunked_body'

module Webmachine
  module Adapters
    class Mongrel2 < Adapter
      def run
        options = configuration.adapter_options
        handler = Handler.new(dispatcher,
                              options[:sender_uuid],
                              options[:recv_addr],
                              options[:send_addr])
        handler.listen
      end

      class Handler
        def initialize(dispatcher, sender_uuid, recv_addr, send_addr)
          @dispatcher = dispatcher
          @connection = ::Mongrel2::Connection.new(sender_uuid, recv_addr, send_addr)
        end

        def listen
          loop do
            request = @connection.receive
            next if request.disconnect?
            process(request)
          end
        end

        def process(req)
          headers = Webmachine::Headers.new
          req.headers.each { |k,v| headers[k] = v }

          host, port = headers['host'].split(':')
          uri = URI::HTTP.build(
            :host  => host,
            :port  => port.to_i,
            :path  => headers['path'],
            :query => headers['query']
          )
          request  = Webmachine::Request.new(headers['method'], uri, headers, req.body)
          response = Webmachine::Response.new
          @dispatcher.dispatch(request, response)

          response.headers['Server'] = [Webmachine::SERVER_STRING, "Mongrel2"].join(" ")

          case response.body
          when String
            @connection.respond(req, ::Mongrel2::Response.new(response.code, response.headers, response.body))
          when Enumerable
            @connection.respond(req, ::Mongrel2::Response.new(response.code, response.headers))
            Webmachine::ChunkedBody.new(response.body).each do |part|
              @connection.respond(req, part)
            end
          when nil
            if headers['method'] != 'HEAD' or not [205, 304, *100..199].flatten.include?(response.code.to_i)
              response.headers['Content-Length'] = 0
            end
            @connection.respond(req, ::Mongrel2::Response.new(response.code, response.headers, ""))
          else
            if response.body.respond_to?(:call)
              @connection.respond(req, ::Mongrel2::Response.new(response.code, response.headers))
              Webmachine::ChunkedBody.new(Array(response.body.call)).each do |part|
                @connection.respond(req, part)
              end
            end
          end
        end
      end
    end
  end
end
