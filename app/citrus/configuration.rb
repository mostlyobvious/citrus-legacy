require 'citrus'
require 'citrus/build_script'

module Citrus
  class Configuration
    class << self
      def describe(&block)
        config = self.new
        block.call(config)
        config
      end

      def load_from_file(path)
        eval File.read(path)
      end
    end

    attr_reader :build_script

    def build(recipe)
      @build_script = BuildScript.new(recipe)
    end

    def valid?
      !!@build_script
    end
  end
end
