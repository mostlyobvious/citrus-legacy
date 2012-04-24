require 'citrus'

module Citrus
  class Build
    include DataMapper::Resource
    extend  Forwardable

    def_delegator :project, :name, :project_name

    belongs_to :project

    has 1, :metadata
    has 1, :result
    has 1, :configuration

    property :build_id, String

    def initialize(metadata)
      super()
      self.metadata = metadata
      self.build_id = SecureRandom.hex(4)
    end

    def run
      prepare_workspace
      checkout_source
      save_result
    end

    def dirname
      Citrus.build_root.join(project_name, Time.now.strftime('%Y/%m/%d'), build_id)
    end

    protected
    def prepare_workspace
      FileUtils.mkdir_p dirname
    end

    def checkout_source
      r = Repository.new(project.source_repository)
      r.clone(dirname)
      r
    end

    def save_result
      r = Result.new
      self.result = r
      save
      r
    end
  end
end
