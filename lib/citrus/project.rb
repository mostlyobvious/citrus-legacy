require 'citrus'
require 'citrus/build'

module Citrus
  class Project
    include DataMapper::Resource

    property :name, String, required: true
    property :source_repository, String, required: true

    has n, :builds
    has n, :build_triggers

    def initialize(name)
      super()
      self.name = name
    end

    def create_build(metadata)
      build = Build.new(metadata)
      self.builds << build
      build
    end
  end
end
