require 'test_helper'

class TeaminvitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teaminvite = teaminvites(:one)
  end

  test "should get index" do
    get teaminvites_url
    assert_response :success
  end

  test "should get new" do
    get new_teaminvite_url
    assert_response :success
  end

  test "should create teaminvite" do
    assert_difference('Teaminvite.count') do
      post teaminvites_url, params: { teaminvite: { email: @teaminvite.email, organization_id: @teaminvite.organization_id, status: @teaminvite.status, team_id: @teaminvite.team_id, user_id: @teaminvite.user_id } }
    end

    assert_redirected_to teaminvite_url(Teaminvite.last)
  end

  test "should show teaminvite" do
    get teaminvite_url(@teaminvite)
    assert_response :success
  end

  test "should get edit" do
    get edit_teaminvite_url(@teaminvite)
    assert_response :success
  end

  test "should update teaminvite" do
    patch teaminvite_url(@teaminvite), params: { teaminvite: { email: @teaminvite.email, organization_id: @teaminvite.organization_id, status: @teaminvite.status, team_id: @teaminvite.team_id, user_id: @teaminvite.user_id } }
    assert_redirected_to teaminvite_url(@teaminvite)
  end

  test "should destroy teaminvite" do
    assert_difference('Teaminvite.count', -1) do
      delete teaminvite_url(@teaminvite)
    end

    assert_redirected_to teaminvites_url
  end
end
