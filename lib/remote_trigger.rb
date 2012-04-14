require 'securerandom'

class RemoteTrigger
  attr_reader :token

  def initialize
    generate_token!
  end

  def generate_token!
    t = SecureRandom.hex
    @token = t
    t
  end
end
