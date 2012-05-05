require 'test_helper'
require 'citrus/build_script'

class BuildScriptTest < UnitTestCase
  def test_should_be_runnable
    script = Citrus::BuildScript.new("rake test")
    assert_respond_to script, :run
  end

  def test_should_execute_string_in_command_line
    script = Citrus::BuildScript.new("echo -n 123")
    output = script.run
    assert_equal "123", output
  end
end
