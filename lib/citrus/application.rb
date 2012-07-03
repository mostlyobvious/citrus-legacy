require 'citrus'
require 'citrus/database'
require 'citrus/build_trigger_resource'
require 'citrus/notifications_resource'
require 'webmachine_adapters_mongrel2'

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
          c.adapter = :Mongrel2
          c.adapter_options = {
            sender_uuid: 'dfe7ff77-5c4c-4a0f-a895-0ed0cd77b77b',
            recv_addr: 'tcp://127.0.0.1:1234',
            send_addr: 'tcp://127.0.0.1:4321'
          }
        end
      end
    end

    def run
      self.webmachine.run
    end
  end
end
