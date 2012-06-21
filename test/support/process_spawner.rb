class ProcessSpawnerError < StandardError; end

class ProcessSpawner
  def initialize(path_or_proc, env = {})
    case path_or_proc
    when Proc
      @proc = path_or_proc
    else
      @path = path_or_proc
      @env  = env
    end
  end

  def spawn
    pid = if @proc
      fork { @proc.call }
    else
      Process.spawn(@env, @path)
    end
    wait_for_readyness
    pid
  end

  def kill(pid)
    return unless pid
    Process.kill("KILL", pid)
    Process.wait(pid)
  end

  def wait_for_readyness
    trap('HUP') { break }
    begin
      Timeout.timeout(5) { loop { sleep } }
    rescue Timeout::Error
      raise ProcessSpawnerError
    end
  end
end

