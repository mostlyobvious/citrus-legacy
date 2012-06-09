require 'test_helper'

class NotificationResourceTest < IntegrationTestCase
  def test_should_stream_notifications_to_clients
    Citrus::Subscriber.expects(:new).returns(Object.new.extend(Enumerable))
    response = get "/notifications"
    assert_equal 200, response.code
    assert_equal "chunked", response.headers["Transfer-Encoding"]
  end
end
