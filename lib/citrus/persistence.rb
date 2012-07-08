require 'citrus'
require 'active_support/core_ext/string/inflections'

module Citrus
  class Persistence
    class Collection
      def initialize
        @store = Hash.new
      end

      def save(key, object)
        @store[key] = object
      end

      def find(key)
        @store[key]
      end

      def count
        @store.keys.size
      end

      def all
        @store.values
      end
    end

    def initialize
      @collections = Hash.new
    end

    def [](arg)
      @collections[arg.to_s.underscore] ||= Collection.new
    end
  end
end
