require 'webmachine/adapters/reel'

module Webmachine
  module Adapters
    class ReelWithParentProcess < Reel
      # XXX: a terrible, terrible hack I should explain:
      #      reel adapter after spawning server loop goes
      #      into sleep in main thread; it's perfect place
      #      to send readiness signal here and continue
      #      though I would not like to rewrite whole
      #      adapter to include just one line
      def sleep
        Process.kill('HUP', Process.ppid) if Process.ppid
        super
      end
    end
  end
end
