require 'citrus/entity'

module Citrus
  class BuildTrigger < Entity
    attr_reader           :token
    attr_accessor         :project
    validates_presence_of :token, :project

    def initialize
      generate_token!
    end

    def generate_token!
      @token = SecureRandom.hex
    end
  end
end
