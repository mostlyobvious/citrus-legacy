require 'celluloid/zmq'

class Celluloid::ZMQ::SubSocket
  def subscribe(channel)
    @socket.setsockopt(::ZMQ::SUBSCRIBE, channel)
  end
end
