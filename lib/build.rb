class Build
  include DataMapper::Resource
  extend  Forwardable

  def_delegator :project, :name, :project_name

  belongs_to :project

  has 1, :metadata
  has 1, :result
  has 1, :configuration

  property :number, Integer

  def initialize(metadata)
    super()
    self.metadata = metadata
  end

  def run
    prepare_workspace
    self.result = Result.new
  end

  def dirname
    Citrus.build_root.join(project_name, Time.now.strftime('%Y%m%d%') + number.to_s)
  end

  protected
  def prepare_workspace
    FileUtils.mkdir_p dirname
  end
end
