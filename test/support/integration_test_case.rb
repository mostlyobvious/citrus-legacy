require 'support/fixtures'
require 'support/filesystem'
require 'support/database'
require 'webmachine/test'
require 'citrus/application'

class IntegrationTestCase < MiniTest::Unit::TestCase
  include Fixtures
  include Filesystem
  include Database
  include Webmachine::Test

  def app
    Citrus::Application.new.webmachine
  end
end

