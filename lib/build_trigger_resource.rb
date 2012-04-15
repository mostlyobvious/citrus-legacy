require 'json'

class BuildTriggerResource < Webmachine::Resource
  def allowed_methods
    ['POST']
  end

  def resource_exists?
    token = request.path_info[:token]
    if trigger = BuildTrigger.first(token: token)
      @project = trigger.project
    end
    !!@project
  end

  def process_post
    metadata = Metadata.parse_from_hook(request.body)
    build    = @project.create_build(metadata)
    true
  end
end
