require 'citrus'
require 'cocaine'

module Citrus
  module Git
    extend self

    def clone(source, destination)
      run('git', 'clone :src :dst', src: source.to_s, dst: destination.to_s)
    end

    def fetch_remote(destination, remote = 'origin')
      run('git', 'fetch :remote', dir: destination.to_s, remote: remote)
    end

    def checkout(destination, revision = nil)
      run('git', 'checkout -b build :revision', dir: destination.to_s, revision: revision)
    end

    def reset(destination, revision = nil)
      run('git', 'reset origin --hard :revision', dir: destination.to_s, revision: revision)
    end

    protected
    def run(cmd, cmd_args, params)
      dir = params.delete(:dir)
      cmd = Cocaine::CommandLine.new(in_path(dir, cmd), cmd_args, params.merge(swallow_stderr: true))
      cmd.run
    end

    def in_path(path, cmd)
      path ? "cd '#{path}' && #{cmd}" : "#{cmd}"
    end
  end
end
