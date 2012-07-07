require 'citrus/entity'

module Citrus
  class Result < Entity
    attribute :status, String
    attribute :output, String

    validates_presence_of :status

    def initialize(status, output = nil)
      self.status, self.output = status, output
    end
  end
end
