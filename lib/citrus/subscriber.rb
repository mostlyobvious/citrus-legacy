require 'citrus'

module Citrus
  class Subscriber
    include Celluloid::ZMQ
    include Enumerable

    def initialize(channel = nil)
      channel ||= Citrus.notification_channel
      @socket = SubSocket.new

      begin
        @socket.connect(Citrus.notification_address)
        @socket.subscribe(channel)
      rescue IOError
        @socket.close
        raise
      end
    end

    def receive
      parse_message(@socket.read)
    end

    def each
      yield receive while true
    end
    alias :subscribe :each

    protected
    def parse_message(msg)
      _, body = msg.split(' ', 2)
      body
    end
  end
end
