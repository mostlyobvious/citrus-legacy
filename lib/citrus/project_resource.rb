require 'citrus'
require 'citrus/project'
require 'citrus/resource'
require 'stringex'

module Citrus
  class ProjectResource < Resource
    def content_types_provided
      [['application/json', :to_json], ['text/html', :to_html]]
    end

    def resource_exists?
      @project = Project.get(request.path_info[:id])
      !!@project
    end

    def accept_json
      data    = JSON.parse(request.body.to_s)
      project = Project.new(data['name'])
      project.source_repository = data['repository']
      project.save
      response.headers['Location'] = "/projects/#{project.id}"
    end

    def to_json
      @project.to_json
    end

    def to_html
      """
      <h1>#{@project.name}</h1>

      Has repository at: #{@project.source_repository}
      """
    end
  end
end
