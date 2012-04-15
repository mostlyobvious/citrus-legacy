class Configuration
  include DataMapper::Resource

  belongs_to :build

  def self.from_file(path)
    # load config from repository
  end
end
