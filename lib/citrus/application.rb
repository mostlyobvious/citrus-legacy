require 'citrus'
require 'citrus/database'
require 'citrus/build_trigger_resource'
require 'webmachine/adapters/reel'

module Citrus
  class Application
    attr_accessor :webmachine

    def initialize
      self.webmachine = Webmachine::Application.new do |app|
        app.routes do
          add ['triggers', :token], BuildTriggerResource
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
