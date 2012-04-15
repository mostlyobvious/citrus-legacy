require 'test_helper'

class ProjectTest < UnitTestCase
  def setup
    @project = Project.new 'awesome project'
  end

  def test_should_have_name
    assert_equal 'awesome project', @project.name
  end

  def test_should_create_builds
    metadata = Metadata.new
    assert_kind_of Build, @project.create_build(metadata)
  end

  def test_should_have_builds
    metadata = Metadata.new
    @project.create_build(metadata)
    assert_kind_of Build, @project.builds.first
  end

  def test_should_have_build_triggers
    @project.build_triggers << BuildTrigger.new
    assert_kind_of BuildTrigger, @project.build_triggers.first
  end
end
