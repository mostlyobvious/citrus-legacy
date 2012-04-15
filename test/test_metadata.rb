require 'test_helper'

class MetadataTest < UnitTestCase
  def setup
    @metadata = Metadata.parse_from_hook(valid_hook_data)
  end

  def test_parsing_from_hook_produces_metadata
    assert_kind_of Metadata, @metadata
  end

  def test_should_parse_revision
    assert_equal @metadata.revision, '560e1628dbb2012ae9a46f80b39a8580e21eb386'
  end

  def test_should_parse_pusher_name
    assert_equal @metadata.pusher_name, 'none'
  end

  def test_should_parse_ref
    assert_equal @metadata.ref, 'refs/heads/master'
  end
end
