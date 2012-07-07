require 'citrus'

module Citrus
  class Metadata
    include DataMapper::Resource

    property :revision, String
    property :pusher_name, String
    property :ref, String

    belongs_to :build

    def self.parse_from_hook(data)
      hash = JSON.parse(data)
      metadata = self.new
      metadata.pusher_name = hash['pusher']['name']
      metadata.revision    = hash['after']
      metadata.ref         = hash['ref']
      metadata
    end
  end
end
