require 'securerandom'
require 'json'

module Citrus
  class << self
    attr_writer :build_root

    def build_root
      @build_root || root.join('builds')
    end

    def root
      Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '..')))
    end
  end
end
