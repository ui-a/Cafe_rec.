require "test_helper"

class Admin::RecordTeaLeavesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_record_tea_leaves_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_record_tea_leaves_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_record_tea_leaves_edit_url
    assert_response :success
  end
end
