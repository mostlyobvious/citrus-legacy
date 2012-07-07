require 'support/fixture_helper'
require 'support/filesystem_helper'
require 'webmachine/test'
require 'citrus/application'

class IntegrationTestCase < MiniTest::Unit::TestCase
  include FixtureHelper
  include FilesystemHelper
  include Webmachine::Test

  def app
    Citrus::Application.new.webmachine
  end
end

