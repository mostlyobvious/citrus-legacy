require 'citrus/commands/add'

module Citrus
  module Commands
    extend self

    def commands
      {
        add: Add
      }
    end
  end
end
