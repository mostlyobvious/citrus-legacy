require 'citrus/command'
require 'citrus/version'
require 'citrus/commands'

module Citrus
  class CLI
    def initialize(argv)
      @main_args, @sub_command, @sub_args = split_main_and_subcommand(argv)
      @commands = Commands.commands
    end

    def run
      opts = OptionParser.new do |opts|
        opts.banner = 'Usage: citrusc [-v] [-h] command [args]'
        opts.separator ''
        opts.on('-v', '--version', 'Print the version and exit.')
        opts.on('-h', '--help', 'Print this help.')
        opts.separator ''
        opts.separator 'Available subcommands:'

        @commands.keys.sort.each do |sub|
          opts.separator "     #{sub}"
        end
        opts.separator ""
        opts.separator "For help on any individual command run `citrusc COMMAND -h`"
      end

      return puts opts if help?
      return puts "Citrus version #{Citrus::VERSION}" if version?

      if cls = @commands[@sub_command.to_sym]
        cls.new(@sub_args).run
      else
        puts opts
      end
    end

    protected
    def help?
      @main_args.include?('-h') || @main_args.include?('--help')
    end

    def version?
      @main_args.include?('-v') || @main_args.include?('--version')
    end

    def split_main_and_subcommand(argv)
      main_args   = nil
      sub_command = nil
      sub_args    = []

      argv.each_index do |i|
        if !argv[i].start_with?("-")
          main_args   = argv[0, i]
          sub_command = argv[i]
          sub_args    = argv[i + 1, argv.length - i + 1]
          break
        end
      end
      main_args = argv.dup if main_args.nil?

      [main_args, sub_command, sub_args]
    end
  end
end

