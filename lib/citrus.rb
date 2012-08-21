require 'pathname'
require 'securerandom'

require 'bundler'
Bundler.require(:default)

module Citrus
  class << self
    attr_writer :cache_root, :build_root

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
  end
end

