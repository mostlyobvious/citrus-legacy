require 'citrus'
require 'citrus/database'
require 'citrus/build_trigger_resource'
require 'citrus/notifications_resource'
require 'citrus/adapter'

module Citrus
  class Application
    attr_accessor :webmachine

    def initialize
      self.webmachine = Webmachine::Application.new do |app|
        app.routes do
          add ['triggers', :token], BuildTriggerResource
          add ['notifications'], NotificationsResource
        end

        app.configure do |c|
          c.adapter = :Reel
        end
      end
    end

    def run
      self.webmachine.run
    end
  end
end
