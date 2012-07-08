require 'citrus/entity'
require 'citrus/build'
require 'citrus/build_trigger'

module Citrus
  class Project < Entity
    attr_reader           :builds, :build_triggers
    attr_accessor         :name, :repository_url
    validates_presence_of :name, :repository_url

    def initialize(name, repository_url)
      @name, @repository_url = name, repository_url
    end

    def add_build(build)
      build.project = self
      @builds ||= Array.new
      @builds << build
    end

    def add_build_trigger(build_trigger)
      build_trigger.project = self
      @build_triggers ||= Array.new
      @build_triggers << build_trigger
    end
  end
end
