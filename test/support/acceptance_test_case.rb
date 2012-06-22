require 'support/process_spawner'
require 'support/actors'

class AcceptanceTestCase < MiniTest::Unit::TestCase
  def setup
    @user   = TestUser.new
    @github = TestGithub.new
  end

  def run(runner, &block)
    output = "F"
    begin
      code    = Proc.new { Citrus::Application.new.run }
      spawner = ProcessSpawner.new(code)
      pid     = spawner.spawn
      super
    rescue => exc
      runner.puke(self.class, self.__name__, exc)
      return output
    ensure
      spawner.kill(pid)
    end
  end
end

