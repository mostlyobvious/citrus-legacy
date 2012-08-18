require 'test_helper'
require 'citrus/result'

class ResultTest < UnitTestCase
  def test_should_not_be_valid_without_status
    result = Citrus::Result.new(nil)
    refute result.valid?
  end
end
