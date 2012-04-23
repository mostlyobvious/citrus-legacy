require 'test_helper'

class BuildTest < UnitTestCase
  def setup
    metadata = Metadata.new
    project  = Project.new('some project')
    @build   = project.create_build(metadata)
  end

  def test_should_be_runnable
    assert_respond_to @build, :run
  end

  def test_should_return_result_after_run
    assert_kind_of Result, @build.run
  end

  def test_should_have_result_after_run
    result = @build.run
    assert_equal result, @build.result
  end

  def test_should_create_build_directory_on_run
    FakeFS do
      @build.run
      assert File.directory?(@build.dirname)
    end
  end
end
