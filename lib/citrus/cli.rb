require 'citrus'

module Citrus
  class CLI < Thor
    desc 'add PROJECT_NAME', 'Add new project'
    method_option :repo, aliases: '-r', required: true, type: :string
    def add(project_name)
      client = HTTPClient.new
      target = 'http://localhost:8080/projects'
      client.post(target,
        name:       project_name,
        repository: options.repo
      )
    end
  end
end

