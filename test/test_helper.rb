gem 'minitest'
require 'minitest/autorun'
require 'webmachine/test'
require 'mocha'

Dir[File.expand_path(File.join(__FILE__, '../support/*.rb'))].each { |m| require m }
require 'citrus/application'

class UnitTestCase < MiniTest::Unit::TestCase
  include Fixtures
  include Filesystem
  include Assertions
end

class IntegrationTestCase < MiniTest::Unit::TestCase
  include Fixtures
  include Filesystem
  include Database
  include Webmachine::Test

  def app
    Citrus::Application.new.webmachine
  end
end
