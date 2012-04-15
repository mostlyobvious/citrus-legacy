require 'webmachine'

class Application
  attr_accessor :webmachine

  def initialize
    self.webmachine = Webmachine::Application.new do |app|
      app.routes do
        add ['triggers', :token], BuildTriggerResource
      end
    end
  end

  def run
    self.webmachine.run
  end
end
