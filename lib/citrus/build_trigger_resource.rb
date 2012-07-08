require 'citrus/metadata'
require 'citrus/build_trigger'
require 'citrus/callback_resource'

module Citrus
  class BuildTriggerResource < CallbackResource
    def resource_exists?
      db[BuildTrigger].exists?(request.path_info[:token])
    end

    def process_post
      project  = db[BuildTrigger].find(request.path_info[:token]).project
      metadata = Metadata.parse_from_hook(request.body)
      build    = Build.new(metadata)
      project.add_build(build)
      build.run
      true
    end
  end
end
