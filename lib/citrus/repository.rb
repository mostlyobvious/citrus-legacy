require 'cocaine'

module Citrus
  class Repository
    def initialize(source_url)
      @source = source_url
    end

    def clone(destination_path)
      cmd = Cocaine::CommandLine.new("git", "clone --depth 1 :src :dst",
        src: @source.to_s,
        dst: destination_path.to_s,
        swallow_stderr: true
      )
      cmd.run
    end
  end
end
