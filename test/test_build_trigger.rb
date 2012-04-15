require 'test_helper'

class BuildTriggerTest < UnitTestCase
  def test_should_return_token
    trigger = BuildTrigger.new
    returned = trigger.generate_token!
    assert_equal trigger.token, returned
  end

  def test_should_regenerate_token
    trigger = BuildTrigger.new
    old_token = trigger.token
    trigger.generate_token!
    refute_equal trigger.token, old_token
  end
end
