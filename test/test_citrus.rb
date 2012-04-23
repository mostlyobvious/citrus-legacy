require 'test_helper'

class CitrusTest < UnitTestCase
  def test_should_have_default_build_root
    assert Citrus.build_root
  end

  def test_should_allow_changing_build_root
    Citrus.build_root = '/tmp'
    assert_equal '/tmp', Citrus.build_root
  end
end
