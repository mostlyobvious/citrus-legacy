class ProcessSpawnerError < StandardError; end

class ProcessSpawner
  def initialize(path, env = {})
    @path = path
    @env  = env
  end

  def spawn
    r, w = IO.pipe
    pid  = Process.spawn(@env, @path, [:err, :out] => w)
    w.close
    wait_for_readyness(r)
    pid
  end

  def kill(pid)
    return unless pid
    Process.kill("KILL", pid)
    Process.wait(pid)
  end

  def wait_for_readyness(fd)
    raise ProcessSpawnerError if fd.read.empty?
  end
end

