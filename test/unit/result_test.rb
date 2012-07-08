require 'test_helper'

class ResultTest < UnitTestCase
  def test_should_not_be_valid_without_status
    result = TestResult.new(:success)
    result.status = nil
    refute result.valid?
  end
end
