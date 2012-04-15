gem 'minitest'
require 'minitest/autorun'
require 'data_mapper'

DataMapper.setup(:default, 'in_memory::')

Dir[File.expand_path(File.join(__FILE__, '../../lib/*.rb'))].each do |m|
  require m
end

module InMemoryStore
  def teardown
    DataMapper.repository(:default).adapter.reset
  end
end

class UnitTestCase < MiniTest::Unit::TestCase
  include InMemoryStore
end
