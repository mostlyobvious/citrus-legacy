require 'citrus'
require 'citrus/project'
require 'citrus/list_resource'

module Citrus
  class ProjectListResource < ListResource
    def content_types_provided
      [['application/json', :to_json], ['text/html', :to_html]]
    end

    def to_html
    """
    <ul>
      #{Project.all.map { |p| "<li>#{p.name}</li>" }}
    </ul>
    """
    end

    def to_json
      Project.all.to_json
    end
  end
end
