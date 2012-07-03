require 'citrus'
require 'citrus/database'
require 'citrus/build_trigger_resource'
require 'citrus/notification_resource'
require 'citrus/project_resource'
require 'citrus/project_list_resource'

module Citrus
  class Application
    attr_accessor :webmachine

    def initialize
      self.webmachine = Webmachine::Application.new do |app|
        app.routes do
          add ['triggers', :token], BuildTriggerResource
          add ['projects'],
            ->(request) { request.method == 'POST' }, ProjectResource
          add ['projects'], ProjectListResource
          add ['projects', :id], ProjectResource
          add ['notifications'], NotificationResource
        end
      end
    end

    def run
      self.webmachine.run
    end
  end
end
