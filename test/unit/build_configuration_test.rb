require 'test_helper'
require 'citrus/build_configuration'

class BuildConfigurationTest < UnitTestCase
  def test_describe_should_return_configuration_instance
    valid_config = Proc.new { |c| c.build('echo -n 123') }
    assert_kind_of Citrus::BuildConfiguration, Citrus::BuildConfiguration.describe(&valid_config)
  end

  def test_should_specify_build_recipe
    invalid_config = Proc.new { }
    refute Citrus::BuildConfiguration.describe(&invalid_config).valid?
  end

  def test_should_load_configuration_from_file
    assert_kind_of Citrus::BuildConfiguration, Citrus::BuildConfiguration.load_from_file(valid_configuration_path)
  end

  def test_should_be_aliased_to_configuration
    assert_kind_of Citrus::BuildConfiguration, Citrus::Configuration.new
  end
end
