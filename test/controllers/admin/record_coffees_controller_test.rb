require "test_helper"

class Admin::RecordCoffeesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_record_coffees_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_record_coffees_edit_url
    assert_response :success
  end

  test "should get new" do
    get admin_record_coffees_new_url
    assert_response :success
  end
end
