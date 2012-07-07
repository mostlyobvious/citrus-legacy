require 'test_helper'

class CitrusTest < UnitTestCase
  def test_should_have_default_build_root
    assert Citrus.build_root
  end

  def test_should_have_default_cache_root
    assert Citrus.cache_root
  end

  def test_should_allow_changing_build_root
    Citrus.build_root = '/build_root'
    assert_equal '/build_root', Citrus.build_root.to_s
  end

  def test_should_allow_changing_cache_root
    Citrus.cache_root = '/cache_root'
    assert_equal '/cache_root', Citrus.cache_root.to_s
  end
end
