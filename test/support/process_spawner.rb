class ProcessSpawnerError < StandardError; end

class ProcessSpawner
  def initialize(path_or_proc, env = {})
    case path_or_proc
    when Proc
      @proc = path_or_proc
    else
      @path = path_or_proc
      @env  = env
      @opts = { err: '/dev/null' }
    end
  end

  def spawn
    @proc ? fork { @proc.call } : Process.spawn(@env, @path, @opts)
  end

  def spawn_and_wait_for_pidfile(path)
    spawn
    read_pid_from_file(path)
  end

  def self.kill(*pids)
    pids.each do |pid|
      next unless pid
      Process.kill("TERM", pid)
    end
  end

  protected
  def read_pid_from_file(pidfile)
    pid = nil
    Timeout.timeout(1) do
      loop do
        begin
          pid = File.read(pidfile)
          break unless pid.empty?
        rescue Errno::ENOENT
          sleep(0.1)
          next
        end
      end
      pid.to_i
    end
  rescue Timeout::Error
    raise ProcessSpawnerError
  end
end

