require 'test_helper'

class PasswordResetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get password_resets_new_url
    assert_response :success
  end

  test "should get show" do
    get password_resets_show_url
    assert_response :success
  end

end
