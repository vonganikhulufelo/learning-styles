require 'test_helper'

class AcceptInvitationsControllerTest < ActionDispatch::IntegrationTest
  test "should get accepted" do
    get accept_invitations_accepted_url
    assert_response :success
  end

end
