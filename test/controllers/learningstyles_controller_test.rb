require 'test_helper'

class LearningstylesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @learningstyle = learningstyles(:one)
  end

  test "should get index" do
    get learningstyles_url
    assert_response :success
  end

  test "should get new" do
    get new_learningstyle_url
    assert_response :success
  end

  test "should create learningstyle" do
    assert_difference('Learningstyle.count') do
      post learningstyles_url, params: { learningstyle: { activisttotal: @learningstyle.activisttotal, actstatus: @learningstyle.actstatus, fname: @learningstyle.fname, lname: @learningstyle.lname, pragmatisttotal: @learningstyle.pragmatisttotal, pragstatus: @learningstyle.pragstatus, question10: @learningstyle.question10, question11: @learningstyle.question11, question12: @learningstyle.question12, question13: @learningstyle.question13, question14: @learningstyle.question14, question15: @learningstyle.question15, question16: @learningstyle.question16, question17: @learningstyle.question17, question18: @learningstyle.question18, question19: @learningstyle.question19, question1: @learningstyle.question1, question20: @learningstyle.question20, question21: @learningstyle.question21, question22: @learningstyle.question22, question23: @learningstyle.question23, question24: @learningstyle.question24, question25: @learningstyle.question25, question26: @learningstyle.question26, question27: @learningstyle.question27, question28: @learningstyle.question28, question29: @learningstyle.question29, question2: @learningstyle.question2, question30: @learningstyle.question30, question31: @learningstyle.question31, question32: @learningstyle.question32, question33: @learningstyle.question33, question34: @learningstyle.question34, question35: @learningstyle.question35, question36: @learningstyle.question36, question37: @learningstyle.question37, question38: @learningstyle.question38, question39: @learningstyle.question39, question3: @learningstyle.question3, question40: @learningstyle.question40, question41: @learningstyle.question41, question42: @learningstyle.question42, question43: @learningstyle.question43, question44: @learningstyle.question44, question45: @learningstyle.question45, question46: @learningstyle.question46, question47: @learningstyle.question47, question48: @learningstyle.question48, question49: @learningstyle.question49, question4: @learningstyle.question4, question50: @learningstyle.question50, question51: @learningstyle.question51, question52: @learningstyle.question52, question53: @learningstyle.question53, question54: @learningstyle.question54, question55: @learningstyle.question55, question56: @learningstyle.question56, question57: @learningstyle.question57, question58: @learningstyle.question58, question59: @learningstyle.question59, question5: @learningstyle.question5, question60: @learningstyle.question60, question61: @learningstyle.question61, question62: @learningstyle.question62, question63: @learningstyle.question63, question64: @learningstyle.question64, question65: @learningstyle.question65, question66: @learningstyle.question66, question67: @learningstyle.question67, question68: @learningstyle.question68, question69: @learningstyle.question69, question6: @learningstyle.question6, question70: @learningstyle.question70, question71: @learningstyle.question71, question72: @learningstyle.question72, question73: @learningstyle.question73, question74: @learningstyle.question74, question75: @learningstyle.question75, question76: @learningstyle.question76, question77: @learningstyle.question77, question78: @learningstyle.question78, question79: @learningstyle.question79, question7: @learningstyle.question7, question80: @learningstyle.question80, question8: @learningstyle.question8, question9: @learningstyle.question9, reflectortotal: @learningstyle.reflectortotal, refstatus: @learningstyle.refstatus, theoristtotal: @learningstyle.theoristtotal, theostatus: @learningstyle.theostatus, user_id: @learningstyle.user_id } }
    end

    assert_redirected_to learningstyle_url(Learningstyle.last)
  end

  test "should show learningstyle" do
    get learningstyle_url(@learningstyle)
    assert_response :success
  end

  test "should get edit" do
    get edit_learningstyle_url(@learningstyle)
    assert_response :success
  end

  test "should update learningstyle" do
    patch learningstyle_url(@learningstyle), params: { learningstyle: { activisttotal: @learningstyle.activisttotal, actstatus: @learningstyle.actstatus, fname: @learningstyle.fname, lname: @learningstyle.lname, pragmatisttotal: @learningstyle.pragmatisttotal, pragstatus: @learningstyle.pragstatus, question10: @learningstyle.question10, question11: @learningstyle.question11, question12: @learningstyle.question12, question13: @learningstyle.question13, question14: @learningstyle.question14, question15: @learningstyle.question15, question16: @learningstyle.question16, question17: @learningstyle.question17, question18: @learningstyle.question18, question19: @learningstyle.question19, question1: @learningstyle.question1, question20: @learningstyle.question20, question21: @learningstyle.question21, question22: @learningstyle.question22, question23: @learningstyle.question23, question24: @learningstyle.question24, question25: @learningstyle.question25, question26: @learningstyle.question26, question27: @learningstyle.question27, question28: @learningstyle.question28, question29: @learningstyle.question29, question2: @learningstyle.question2, question30: @learningstyle.question30, question31: @learningstyle.question31, question32: @learningstyle.question32, question33: @learningstyle.question33, question34: @learningstyle.question34, question35: @learningstyle.question35, question36: @learningstyle.question36, question37: @learningstyle.question37, question38: @learningstyle.question38, question39: @learningstyle.question39, question3: @learningstyle.question3, question40: @learningstyle.question40, question41: @learningstyle.question41, question42: @learningstyle.question42, question43: @learningstyle.question43, question44: @learningstyle.question44, question45: @learningstyle.question45, question46: @learningstyle.question46, question47: @learningstyle.question47, question48: @learningstyle.question48, question49: @learningstyle.question49, question4: @learningstyle.question4, question50: @learningstyle.question50, question51: @learningstyle.question51, question52: @learningstyle.question52, question53: @learningstyle.question53, question54: @learningstyle.question54, question55: @learningstyle.question55, question56: @learningstyle.question56, question57: @learningstyle.question57, question58: @learningstyle.question58, question59: @learningstyle.question59, question5: @learningstyle.question5, question60: @learningstyle.question60, question61: @learningstyle.question61, question62: @learningstyle.question62, question63: @learningstyle.question63, question64: @learningstyle.question64, question65: @learningstyle.question65, question66: @learningstyle.question66, question67: @learningstyle.question67, question68: @learningstyle.question68, question69: @learningstyle.question69, question6: @learningstyle.question6, question70: @learningstyle.question70, question71: @learningstyle.question71, question72: @learningstyle.question72, question73: @learningstyle.question73, question74: @learningstyle.question74, question75: @learningstyle.question75, question76: @learningstyle.question76, question77: @learningstyle.question77, question78: @learningstyle.question78, question79: @learningstyle.question79, question7: @learningstyle.question7, question80: @learningstyle.question80, question8: @learningstyle.question8, question9: @learningstyle.question9, reflectortotal: @learningstyle.reflectortotal, refstatus: @learningstyle.refstatus, theoristtotal: @learningstyle.theoristtotal, theostatus: @learningstyle.theostatus, user_id: @learningstyle.user_id } }
    assert_redirected_to learningstyle_url(@learningstyle)
  end

  test "should destroy learningstyle" do
    assert_difference('Learningstyle.count', -1) do
      delete learningstyle_url(@learningstyle)
    end

    assert_redirected_to learningstyles_url
  end
end
