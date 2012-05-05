require 'citrus'
require 'cocaine'

module Citrus
  class BuildScript
    def initialize(recipe)
      @recipe = recipe
    end

    def run
      case @recipe
      when String
        exec, args = @recipe.split(' ', 2)
        cmd = Cocaine::CommandLine.new(exec, args)
        cmd.run
      end
    end
  end
end
