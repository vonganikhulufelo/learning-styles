require 'test_helper'

class AcceptsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get accepts_show_url
    assert_response :success
  end

end
