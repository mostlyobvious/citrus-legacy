require 'citrus'
require 'citrus/result'
require 'cocaine'

module Citrus
  class BuildScript
    def initialize(recipe)
      @recipe = recipe
    end

    def run
      output = case @recipe
               when String
                 exec, args = @recipe.split(' ', 2)
                 cmd = Cocaine::CommandLine.new(exec, args)
                 cmd.run
               end
      Result.new(:success, output)
    rescue Cocaine::ExitStatusError, Cocaine::CommandNotFoundError
      Result.new(:failed, output)
    end
  end
end
