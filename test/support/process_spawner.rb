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

  def spawn(pidfile = nil)
    pid = if @proc
            fork { @proc.call }
          else
            Process.spawn(@env, @path, @opts)
          end
    pidfile ? read_pid_from_file(pidfile) : pid
  end

  def self.kill(*pids)
    pids.each do |pid|
      next unless pid
      Process.kill("TERM", pid)
    end
  end

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

