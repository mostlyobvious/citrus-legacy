require 'citrus'

module Citrus
  class Publisher
    include Celluloid::ZMQ

    def initialize(channel = nil)
      @channel = channel || Citrus.notification_channel
      @socket  = PubSocket.new

      begin
        @socket.bind(Citrus.notification_address)
      rescue IOError
        @socket.close
        raise
      end
    end

    def publish(message)
      @socket.send("#{@channel} #{message}")
    end
  end
end
