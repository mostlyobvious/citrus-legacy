require 'test_helper'

class ProjectResourceTest < IntegrationTestCase
  def test_should_create_project_with_valid_params
    response = post '/projects',
      body: valid_params.to_json,
      headers: valid_headers
    assert_equal 201, response.code
    assert_equal '/projects/citrus-app', response.headers['Location']
  end

  def valid_headers
    {'Content-Type' => 'application/json'}
  end

  def valid_params
    {
      name: 'citrus app',
      repository_url: 'git://github.com/pawelpacana/citrus'
    }
  end
end
