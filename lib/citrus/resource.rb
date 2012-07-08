require 'webmachine/resource'
require 'citrus'

module Citrus
  class Resource < Webmachine::Resource
    def db
      Citrus.db
    end

    def content_types_provided
      [['application/json', :to_json]]
    end

    def content_types_accepted
      [['application/json', :accept_json]]
    end

    def accept_json
    end

    def allow_missing_post?
      !request.path_info.has_key?(:id)
    end

    def allowed_methods
      if request.path_info.has_key?(:id)
        %w(HEAD GET)
      else
        %w(POST)
      end
    end

    def post_is_create?
      !request.path_info.has_key?(:id)
    end

    def create_path
      '/dummy' # Explanation why such a hack:
               # https://github.com/seancribbs/webmachine-ruby/pull/26
    end

    def resource_exists?
      if request.path_info[:id]
      end
    end
  end
end
