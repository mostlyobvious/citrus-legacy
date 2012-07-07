require 'bundler'
Bundler.require(:default)

require 'securerandom'
require 'json'

Celluloid.logger = nil

module Citrus
  class << self
    attr_writer :build_root

    def build_root
      @build_root || root.join('builds')
    end

    def cache_root
      @cache_root || root.join('cache')
    end

    def root
      Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '..')))
    end

    def notification_address
      'tcp://127.0.0.1:1234'
    end

    def notification_channel
      'citrus'
    end

    def environment
      ENV['CITRUS_ENV'] ||= 'development'
    end

    def test?
      environment == 'test'
    end
  end
end
