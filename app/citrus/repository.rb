require 'citrus'
require 'citrus/git'
require 'citrus/utils'

module Citrus
  class Repository
    include Utils

    def initialize(repository_url)
      @source = repository_url
    end

    def checkout(destination, revision = nil)
      update_cache
      Git.clone(cache_dir, destination)
      Git.checkout(destination, revision)
    end

    def cache_dir
      Citrus.cache_root.join(name_from_url(@source))
    end

    protected
    def update_cache
      unless cache_dir.exist?
        FileUtils.mkdir_p(cache_dir)
        Git.clone(@source, cache_dir)
      else
        raise
        Git.fetch_remote(cache_dir)
        Git.reset(cache_dir)
      end
    end
  end
end
