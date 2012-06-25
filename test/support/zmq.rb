require 'm2r'

module Mongrel2
  module ZMQ
    def self.context
      ctx = ::ZMQ::Context.new(1)
      ctx.__send__(:remove_finalizer)
      ctx
    end
  end
end
