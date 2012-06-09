class ProcessSpawnerError < StandardError; end

class ProcessSpawner
  def initialize(path, env = {})
    @path = path
    @env  = env
  end

  def spawn
    pid  = Process.spawn(@env, @path)
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

