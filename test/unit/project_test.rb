require 'test_helper'

class ProjectTest < UnitTestCase
  def setup
    name, repo = 'awesome project', 'git://github.com/pawelpacana/citrus.git'
    @project = Citrus::Project.new(name, repo)
  end

  def test_should_be_valid
    assert @project.valid?
  end

  def test_should_have_name
    assert_equal 'awesome project', @project.name
  end

  def test_should_have_source_repository
    assert_equal 'git://github.com/pawelpacana/citrus.git', @project.source_repository
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

  def test_should_be_invalid_without_name
    @project.name = nil
    refute @project.valid?
  end

  def test_should_be_invalid_without_source_repository
    @project.source_repository = nil
    refute @project.valid?
  end
end
