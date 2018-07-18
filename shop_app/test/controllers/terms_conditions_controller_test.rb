require 'test_helper'

class TermsConditionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get terms_conditions_index_url
    assert_response :success
  end

end
