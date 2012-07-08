require 'webmachine/resource'
require 'citrus'

module Citrus
  class CallbackResource < Webmachine::Resource
    def db
      Citrus.db
    end

    def content_types_accepted
      [['application/json', :dummy]]
    end

    def allowed_methods
      %w(POST)
    end
  end
end
