require 'securerandom'

class BuildTrigger
  include DataMapper::Resource

  property :token, String

  belongs_to :project

  def generate_token!
    t = SecureRandom.hex
    @token = t
    t
  end
end
