require 'citrus/entity'

module Citrus
  class BuildTrigger < Entity
    attr_accessor :project
    attribute     :token, String

    validates_presence_of :token, :project

    def initialize
      generate_token!
    end

    def generate_token!
      self.token = SecureRandom.hex
    end
  end
end
