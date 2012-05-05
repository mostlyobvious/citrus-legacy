require 'test_helper'
require 'citrus/build_script'

class BuildScriptTest < UnitTestCase
  def test_should_be_runnable
    script = Citrus::BuildScript.new("rake test")
    assert_respond_to script, :run
  end

  def test_should_return_result
    script = Citrus::BuildScript.new("echo -n 123")
    assert_kind_of Citrus::Result, script.run
  end

  def test_should_execute_string_in_command_line
    script = Citrus::BuildScript.new("echo -n 123")
    result = script.run
    assert_equal "123", result.output
  end
end
