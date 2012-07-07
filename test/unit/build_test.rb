require 'test_helper'
require 'citrus/build'
require 'citrus/result'
require 'citrus/repository'

class BuildTest < UnitTestCase
  include FilesystemHelper

  def setup
    @build = Citrus::Build.new(valid_metadata)
    @build.project = valid_project
  end

  def test_should_be_valid
    assert @build.valid?
  end

  def test_should_be_runnable
    assert_respond_to @build, :run
  end

  def test_should_return_result_after_run
    mock_checkout
    mock_config
    assert_kind_of Citrus::Result, @build.run
  end

  def test_should_have_result_after_run
    mock_checkout
    mock_config
    result = @build.run
    assert_equal result, @build.result
  end

  def test_should_execute_build_script_on_run
    mock_checkout
    mock_config
    Citrus::BuildExecutor.any_instance.expects(:run)
    @build.run
  end

  def test_should_create_build_directory_on_run
    mock_checkout
    mock_config
    with_citrus_root do |root|
      @build.run
      assert File.directory? @build.dirname
    end
  end

  def test_should_partition_build_directory_to_avoid_long_fs_seeks
    assert_match /\d{4}\/\d{2}\/\d{2}.{8}/, @build.dirname.to_s
  end

  def mock_checkout
    Citrus::Repository.any_instance.expects(:checkout).returns(nil)
  end

  def mock_config
    Citrus::Configuration.expects(:load_from_file).returns(valid_configuration)
  end
end
