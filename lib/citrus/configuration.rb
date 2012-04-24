require 'citrus'

module Citrus
  class Configuration
    include DataMapper::Resource

    belongs_to :build
  end
end
