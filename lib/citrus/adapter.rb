require 'webmachine/adapters/reel'

module Webmachine
  module Adapters
    class Reel
      def run
        options = {
          :port => configuration.port,
          :host => configuration.ip
        }.merge(configuration.adapter_options)
        server = ::Reel::Server.supervise(options[:host], options[:port], &method(:process))
        trap("INT"){ server.terminate; exit 0 }

        Process.kill('HUP', Process.ppid) if Citrus.test?
        sleep
      end
    end
  end
end
