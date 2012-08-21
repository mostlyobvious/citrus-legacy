require 'citrus/entity'

module Citrus
  class Result < Entity
    attr_reader           :status, :output
    validates_presence_of :status

    def initialize(status, output = nil)
      @status, @output = status, output
    end
  end
end
