require 'support/process_spawner'

class AcceptanceTestCase < MiniTest::Unit::TestCase
  def run(runner, &block)
    output = "F"
    begin
      spawner = ProcessSpawner.new("bundle exec ruby %s" % Citrus.root.join('bin', 'citrusd'))
      pid = spawner.spawn
      super
    rescue => exc
      runner.puke(self.class, self.__name__, exc)
      return output
    ensure
      spawner.kill(pid)
    end
  end
end

