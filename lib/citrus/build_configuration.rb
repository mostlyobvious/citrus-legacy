require 'citrus/entity'

module Citrus
  class BuildConfiguration < Entity
    attr_reader           :build_script
    validates_presence_of :build_script

    def self.describe(&block)
      config = self.new
      block.call(config)
      config
    end

    def self.load_from_file(path)
      eval File.read(path)
    end

    def build(recipie)
      @build_script = recipie
    end
  end

  Configuration = BuildConfiguration
end

