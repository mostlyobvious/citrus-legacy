require 'support/fixtures'
require 'support/filesystem'
require 'support/assertions'

class UnitTestCase < MiniTest::Unit::TestCase
  include Fixtures
  include Filesystem
  include Assertions
end


