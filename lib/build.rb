class Build
  attr_reader :configuration, :metadata, :result

  def initialize(configuration, metadata)
    @configuration = configuration
    @metadata = metadata
  end

  def run
    @result = Result.new
    @result
  end
end
