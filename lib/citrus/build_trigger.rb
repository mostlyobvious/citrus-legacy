require 'citrus'

module Citrus
  class BuildTrigger
    include DataMapper::Resource

    property :token, String

    belongs_to :project

    def initialize(*args)
      super
      generate_token!
    end

    def generate_token!
      self.token = SecureRandom.hex
    end
  end
end
