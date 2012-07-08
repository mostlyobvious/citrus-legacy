module Citrus
  class << self
    attr_writer :cache_root, :build_root

    def boot!
      require_stdlib
      require_bundler_default_group
      adjust_load_path
    end

    def build_root
      @build_root || root.join('builds')
    end

    def cache_root
      @cache_root || root.join('cache')
    end

    def root
      Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '..')))
    end

    def environment
      ENV['CITRUS_ENV'] ||= 'development'
    end

    def db
      @db ||= begin
                require 'citrus/persistence'
                Citrus::Persistence.new
              end
    end

    protected
    def require_bundler_default_group
      require 'bundler'
      Bundler.require(:default)
    end

    def require_stdlib
      require 'pathname'
      require 'securerandom'
    end

    def adjust_load_path
      $:.unshift Citrus.root.join('app').to_s
    end
  end
end

Citrus.boot!

