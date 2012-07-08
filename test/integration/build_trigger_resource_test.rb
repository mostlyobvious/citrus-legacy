require 'test_helper'
require 'citrus/build'
require 'citrus/build_trigger'

class BuildTriggerResourceTest < IntegrationTestCase
  def setup
    @trigger = valid_trigger
    Citrus.db[Citrus::BuildTrigger].save(@trigger.token, @trigger)
  end

  def teardown
    Citrus.db.clear
  end

  def test_should_process_hook_with_correct_token
    Citrus::Build.any_instance.expects(:run).returns(valid_result)
    response = post "/triggers/#{@trigger.token}",
      body: valid_hook_data,
      headers: valid_headers
    assert_equal 204, response.code
  end

  def test_should_not_process_hook_with_incorrect_token
    response = post "/triggers/non_existing_token",
      body: valid_hook_data,
      headers: valid_headers
    assert_equal 404, response.code
  end

  def test_should_start_build_process
    Citrus::Build.any_instance.expects(:run).returns(valid_result)
    post "/triggers/#{@trigger.token}", body: valid_hook_data
  end

  def valid_headers
    {'Content-Type' => 'application/json'}
  end
end
