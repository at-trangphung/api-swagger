require 'test_helper'

class ThanksForOrderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get thanks_for_order_index_url
    assert_response :success
  end

end
