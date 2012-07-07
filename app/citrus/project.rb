require 'citrus'
require 'citrus/build'

module Citrus
  class Project
    include DataMapper::Resource

    property :id, Serial
    property :name, String, required: true
    property :source_repository, String, required: true

    has n, :builds
    has n, :build_triggers

    def initialize(name, repository)
      super()
      self.name = name
      self.source_repository = repository
    end

    def create_build(metadata)
      build = Build.new(metadata)
      self.builds << build
      build
    end
  end
end
