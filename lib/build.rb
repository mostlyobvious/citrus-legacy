class Build
  include DataMapper::Resource

  belongs_to :project
  has 1, :metadata
  has 1, :result
  has 1, :configuration

  def initialize(metadata)
    super()
    self.metadata = metadata
  end

  def run
    self.result = Result.new
  end
end
