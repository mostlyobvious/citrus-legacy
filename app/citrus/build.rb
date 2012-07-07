require 'citrus/entity'
require 'citrus/result'
require 'citrus/metadata'
require 'citrus/repository'
require 'citrus/build_executor'
require 'citrus/build_configuration'

module Citrus
  class Build < Entity
    extend  Forwardable
    def_delegator :project, :name, :project_name
    attr_accessor :project

    attribute :id,            String
    attribute :metadata,      Citrus::Metadata
    attribute :result,        Citrus::Result
    attribute :configuration, Citrus::BuildConfiguration

    validates_presence_of :project, :metadata, :result, :id

    def initialize(metadata)
      self.metadata = metadata
      self.result   = Result.new(:not_started)
      self.id = SecureRandom.hex(4)
    end

    def run
      prepare_workspace
      checkout_source
      load_configuration
      execute_build_script
    end

    def dirname
      Citrus.build_root.join(project_name, partition, id)
    end

    protected
    def partition
      Time.now.strftime('%Y/%m/%d')
    end

    def prepare_workspace
      FileUtils.mkdir_p(dirname)
    end

    def checkout_source
      repo = Repository.new(project.repository_url)
      repo.checkout(dirname)
    end

    def load_configuration
      config_path = File.join(dirname, '.citrus/config.rb')
      self.configuration = BuildConfiguration.load_from_file(config_path)
    end

    def execute_build_script
      exec   = BuildExecutor.new(self.configuration.build_script)
      result = exec.run
      self.result = result
      result
    end
  end
end
