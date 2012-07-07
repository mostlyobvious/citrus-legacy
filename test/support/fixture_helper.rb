require 'citrus/result'
require 'citrus/project'
require 'citrus/metadata'
require 'citrus/build_trigger'
require 'citrus/build_configuration'

module FixtureHelper
  def valid_project
    Citrus::Project.new('sample project', valid_repository_url)
  end

  def valid_result
    Citrus::Result.new(:success, '123')
  end

  def valid_trigger
    bt = Citrus::BuildTrigger.new
    bt.project = valid_project
    bt
  end

  def valid_metadata
    Citrus::Metadata.new
  end

  def valid_configuration_path
    File.join(valid_repository_path, '.citrus/config.rb')
  end

  def valid_configuration
    bc = Citrus::BuildConfiguration.new
    bc.build('echo -n 123')
    bc
  end

  def valid_repository_path
    File.expand_path(File.join(__FILE__, '../repository'))
  end

  def valid_repository_url
    "git://github.com/pawelpacana/citrus.git"
  end

  def valid_hook_data
    Citrus.root.join('test/support/push_hook_data.json').read
  end
end

