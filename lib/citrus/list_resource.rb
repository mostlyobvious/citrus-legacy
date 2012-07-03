require 'citrus'
require 'webmachine/resource'

module Citrus
  class ListResource < Webmachine::Resource
    def allowed_methods
      %w(GET HEAD)
    end

    def content_types_provided
      [['application/json', :to_json]]
    end

    def to_json
    end
  end
end
