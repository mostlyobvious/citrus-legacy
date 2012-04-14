require 'test_helper'

class RemoteTriggerTest < MiniTest::Unit::TestCase
  def test_should_have_token
    trigger = RemoteTrigger.new
    assert trigger.token
  end

  def test_should_return_token
    trigger = RemoteTrigger.new
    returned = trigger.generate_token!
    assert_equal trigger.token, returned
  end

  def test_should_regenerate_token
    trigger = RemoteTrigger.new
    old_token = trigger.token
    trigger.generate_token!
    refute_equal trigger.token, old_token
  end
end
