require 'test_helper'

class ProjectTest < UnitTestCase
  def setup
    @project = Citrus::Project.new('awesome project')
  end

  def test_should_have_name
    assert_equal 'awesome project', @project.name
  end

  def test_should_create_builds
    assert_kind_of Citrus::Build, @project.create_build(valid_metadata)
  end

  def test_should_have_builds
    @project.create_build(valid_metadata)
    assert_kind_of Citrus::Build, @project.builds.first
  end

  def test_should_have_build_triggers
    @project.build_triggers << Citrus::BuildTrigger.new
    assert_kind_of Citrus::BuildTrigger, @project.build_triggers.first
  end
end
