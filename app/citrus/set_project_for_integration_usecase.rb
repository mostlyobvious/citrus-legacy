require 'citrus'

module Citrus
  class SetProjectForIntegrationUsecase
    def initialize(project)
      $stdout.sync = true
      $stdout.puts ">> in a usecase"
    end

    def call
    end
  end
end
