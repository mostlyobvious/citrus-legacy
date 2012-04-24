require 'test_helper'

class BuildTriggerResourceTest < WebmachineTestCase
  def setup
    @trigger = valid_trigger
    @project = valid_project
    @project.build_triggers << @trigger
    @project.save
  end

  def test_should_process_hook_with_correct_token
    Build.any_instance.expects(:run).returns(valid_result)
    response = post "/triggers/#{@trigger.token}", body: valid_hook_data
    assert_equal 204, response.code
  end

  def test_should_not_process_hook_with_incorrect_token
    response = post "/triggers/non_existing_token", body: valid_hook_data
    assert_equal 404, response.code
  end

  def test_should_start_build_process
    Build.any_instance.expects(:run).returns(valid_result)
    post "/triggers/#{@trigger.token}", body: valid_hook_data
  end
end
