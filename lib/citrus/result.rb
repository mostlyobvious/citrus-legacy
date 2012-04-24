require 'citrus'

module Citrus
  class Result
    include DataMapper::Resource

    belongs_to :build
  end
end
