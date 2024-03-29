require 'citrus/entity'

module Citrus
  class Metadata < Entity
    attr_accessor         :revision, :pusher_name, :ref
    validates_presence_of :revision, :pusher_name, :ref

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
