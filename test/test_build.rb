require 'test_helper'

class BuildTest < MiniTest::Unit::TestCase
  def setup
    config   = Configuration.new
    metadata = Metadata.new
    project  = Project.new('some project')
    @build   = project.create_build(config, metadata)
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
end
