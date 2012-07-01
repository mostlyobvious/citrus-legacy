require 'citrus'
require 'optparse'

module Citrus
  class Command
    def initialize(argv)
      @argv = argv
    end

    def run; end

    protected
    def parse_options(opts = nil)
      argv = @argv.dup
      opts ||= OptionParser.new

      opts.on_tail('-h', '--help', 'Print this help.') do
        puts opts.help
      end
      opts.parse!(argv)
    end
  end
end
