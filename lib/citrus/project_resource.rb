require 'citrus'
require 'citrus/project'
require 'citrus/resource'

require 'json'

module Citrus
  class ProjectResource < Resource
    def content_types_provided
      [['application/json', :to_json], ['text/html', :to_html]]
    end

    def resource_exists?
      db[Project].exists?(request.path_info[:id])
    end

    def accept_json
      params  = JSON.parse(request.body.to_s)
      project = Project.new(
        params['name'],
        params['repository_url']
      )
      db[Project].save(project.name, project)
      response.headers['Location'] = "/projects/#{project.id}"
    end

    def to_json
      project = db[Project].find(request.path_info[:id])
      project.to_json
    end

    def to_html
      project = db[Project].find(request.path_info[:id])
      """
      <h1>#{project.name}</h1>

      Has repository at: #{project.repository_url}
      """
    end
  end
end
