require 'test_helper'

class ProjectTest < UnitTestCase
  def setup
    @project = Citrus::Project.new('awesome project', valid_repository_url)
  end

  def test_should_be_valid
    assert @project.valid?
  end

  def test_should_have_name
    assert_equal 'awesome project', @project.name
  end

  def test_should_have_repository_url
    assert_equal 'git://github.com/pawelpacana/citrus.git', @project.repository_url
  end

  def test_should_allow_adding_builds
    @project.add_build(Citrus::Build.new(valid_metadata))
    assert_kind_of Citrus::Build, @project.builds.first
    assert_equal @project, @project.builds.first.project
  end

  def test_should_allow_adding_build_triggers
    @project.add_build_trigger(Citrus::BuildTrigger.new)
    assert_kind_of Citrus::BuildTrigger, @project.build_triggers.first
    assert_equal @project, @project.build_triggers.first.project
  end

  def test_should_be_invalid_without_name
    @project.name = nil
    refute @project.valid?
  end

  def test_should_be_invalid_without_repository_url
    @project.repository_url = nil
    refute @project.valid?
  end

  def test_should_have_whitespace_friendly_id
    assert_equal 'awesome-project', @project.id
  end
end
