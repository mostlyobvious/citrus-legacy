require 'citrus/entity'
require 'citrus/build'
require 'citrus/build_trigger'

module Citrus
  class Project < Entity
    attribute :name,           String
    attribute :repository_url, String
    attribute :builds,         Array[Citrus::Build],        default: []
    attribute :build_triggers, Array[Citrus::BuildTrigger], default: []

    validates_presence_of :name, :repository_url

    def initialize(name, repository_url)
      self.name, self.repository_url = name, repository_url
    end

    def add_build(build)
      build.project = self
      self.builds << build
    end

    def add_build_trigger(build_trigger)
      build_trigger.project = self
      self.build_triggers << build_trigger
    end
  end
end
