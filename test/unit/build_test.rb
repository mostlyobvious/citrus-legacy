require 'test_helper'
require 'citrus/build'
require 'citrus/result'
require 'citrus/repository'

class BuildTest < UnitTestCase
  def setup
    @metadata = valid_metadata
    @project  = valid_project
    @build    = @project.create_build(@metadata)
  end

  def test_should_be_runnable
    assert_respond_to @build, :run
  end

  def test_should_return_result_after_run
    Citrus::Repository.any_instance.expects(:checkout).returns(nil)
    Citrus::Configuration.expects(:load_from_file).returns(valid_configuration)
    assert_kind_of Citrus::Result, @build.run
  end

  def test_should_have_result_after_run
    Citrus::Repository.any_instance.expects(:checkout).returns(nil)
    Citrus::Configuration.expects(:load_from_file).returns(valid_configuration)
    result = @build.run
    assert_equal result, @build.result
  end

  def test_should_create_build_directory_on_run
    Citrus::Repository.any_instance.expects(:checkout).returns(nil)
    Citrus::Configuration.expects(:load_from_file).returns(valid_configuration)
    with_citrus_root do
      @build.run
      assert_directory @build.dirname
    end
  end

  def test_should_partition_build_directory_to_avoid_long_fs_seeks
    assert_match /\d{4}\/\d{2}\/\d{2}.{8}/, @build.dirname.to_s
  end

  def test_should_clone_repository_on_run
    with_citrus_root do
      @build.run
      assert_git_repository @build.dirname
    end
  end
end
