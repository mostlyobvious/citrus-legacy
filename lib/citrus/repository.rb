require 'citrus'
require 'cocaine'

module Citrus
  class Repository
    def initialize(remote_url)
      @source = remote_url
    end

    def checkout(destination_path, revision = nil)
      clone_repository(@source, destination_path)
      checkout_revision(destination_path, revision) if revision
    end

    protected
    def clone_repository(remote_url, destination_path)
      cmd = Cocaine::CommandLine.new('git', 'clone :remote :destination',
        remote: remote_url,
        destination: destination_path.to_s,
        swallow_stderr: true
      )
      cmd.run
    end

    def checkout_revision(local_path, revision)
      cmd = Cocaine::CommandLine.new(in_path(local_path, 'git'), 'checkout -b build :revision',
        revision: revision,
        swallow_stderr: true
      )
      cmd.run
    end

    def in_path(path, cmd)
      "cd '#{path.to_s}' && #{cmd}"
    end
  end
end
