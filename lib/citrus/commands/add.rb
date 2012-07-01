require 'citrus/command'

module Citrus
  module Commands
    class Add < Command
      def run
        options = { host: 'http://localhost:8080' }
        opts = OptionParser.new do |opts|
          opts.banner = "Usage: citrusc add NAME -r REPO [-t HOST]"
          opts.separator ""

          opts.on('-r REPO', '--repository', 'Project repository URL') { |r| options[:repo] = r }
          opts.on('-t HOST', '--target', 'Cirtus URL') { |t| options[:host] = t }
        end

        argv = parse_options(opts)
        return puts opts unless argv.first and options[:repo]

        client = HTTPClient.new
        target = File.join(options[:host], 'projects')
        client.post(target, name: argv.first, repository: options[:repo])
      rescue OptionParser::MissingArgument
        puts opts
      end
    end
  end
end
