require 'test_helper'
require 'citrus/utils'

class UtilsTest < UnitTestCase
  def test_name_from_url_and_github
    url = 'git://github.com/picard/repo.git'
    assert_equal Citrus::Utils.name_from_url(url), 'b4ad6690cc6463ecc8e9f73e5f9c16a12ce8a57d'
  end
end
