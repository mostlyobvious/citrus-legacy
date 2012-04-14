class Project
  attr_reader :configuration, :name, :builds, :build_triggers

  def initialize(name)
    @name = name
    @builds = []
    @build_triggers = []
  end

  def create_build(configuration, metadata)
    b = Build.new(configuration, metadata)
    @builds << b
    b
  end
end
