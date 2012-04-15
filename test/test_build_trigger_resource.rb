require 'test_helper'

class BuildTriggerResourceTest < WebmachineTestCase
  def prepare_project_with_trigger_token
    project = Project.new 'build with token'
    trigger = BuildTrigger.new
    project.build_triggers << trigger
    project.save
    trigger.token
  end

  def test_should_process_hook_with_correct_token
    token = prepare_project_with_trigger_token
    response = post "/triggers/#{token}", body: valid_hook_data
    assert_equal 204, response.code
  end

  def test_should_not_process_hook_with_incorrect_token
    response = post "/triggers/non_existing_token", body: valid_hook_data
    assert_equal 404, response.code
  end
end
