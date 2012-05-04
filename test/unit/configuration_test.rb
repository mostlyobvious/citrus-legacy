require 'test_helper'
require 'citrus/configuration'

class ConfigurationTest < UnitTestCase
  def test_describe_should_return_configuration_instance
    assert_kind_of Citrus::Configuration, Citrus::Configuration.describe(&valid_config)
  end

  def test_should_specify_build_recipe
    invalid_config = Proc.new { |x| x.build(nil) }
    refute Citrus::Configuration.describe(&invalid_config).valid?
  end

  def test_should_load_configuration_from_file
    assert_kind_of Citrus::Configuration, Citrus::Configuration.load_from_file(valid_configuration_url)
  end
end
