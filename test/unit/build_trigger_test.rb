require 'citrus/build_trigger'
require 'test_helper'

class BuildTriggerTest < UnitTestCase
  def setup
    @trigger = Citrus::BuildTrigger.new
    @trigger.project = valid_project
  end

  def test_should_be_valid
    assert @trigger.valid?
  end

  def test_should_be_invalid_without_project
    @trigger.project = nil
    refute @trigger.valid?
  end

  def test_should_return_token
    returned = @trigger.generate_token!
    assert_equal @trigger.token, returned
  end

  def test_should_regenerate_token
    old_token = @trigger.token
    @trigger.generate_token!
    refute_equal @trigger.token, old_token
  end

  def test_should_have_token_after_create
    assert @trigger.token
  end
end
