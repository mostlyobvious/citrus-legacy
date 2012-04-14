require 'test_helper'

class ProjectTest < MiniTest::Unit::TestCase
  def setup
    @project = Project.new 'awesome project'
  end

  def test_should_have_name
    assert_equal 'awesome project', @project.name
  end

  def test_should_create_builds
    config   = Configuration.new
    metadata = Metadata.new
    assert_kind_of Build, @project.create_build(config, metadata)
  end

  def test_should_have_builds
    config   = Configuration.new
    metadata = Metadata.new
    @project.create_build(config, metadata)
    assert_kind_of Build, @project.builds.first
  end

  def test_should_have_build_triggers
    @project.build_triggers << RemoteTrigger.new
    assert_kind_of RemoteTrigger, @project.build_triggers.first
  end
end
