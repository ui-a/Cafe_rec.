require "test_helper"

class Public::RecordTeaLeavesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_record_tea_leaves_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_record_tea_leaves_edit_url
    assert_response :success
  end

  test "should get new" do
    get public_record_tea_leaves_new_url
    assert_response :success
  end
end
