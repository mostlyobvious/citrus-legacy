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
      backend = ProcessSpawner.new(code)
      mongrel = ProcessSpawner.new('m2sh start -host localhost -db test/mongrel/config.sqlite')
      b, m    = backend.spawn, mongrel.spawn('run/citrus.pid')
      super
    rescue => exc
      runner.puke(self.class, self.__name__, exc)
      return output
    ensure
      ProcessSpawner.kill(b, m)
    end
  end
end

