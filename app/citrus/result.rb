require 'citrus'

module Citrus
  class Result
    include DataMapper::Resource

    belongs_to :build

    property :status, String
    property :output, String

    def initialize(status, output)
      super()
      self.status = status.to_s
      self.output = output
    end
  end
end
