class Project
  include DataMapper::Resource

  property :name, String, required: true

  has n, :builds
  has n, :build_triggers

  def initialize(name)
    super()
    self.name = name
  end

  def create_build(metadata)
    b = Build.new(metadata)
    builds << b
    b
  end
end
