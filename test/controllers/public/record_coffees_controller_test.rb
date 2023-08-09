require "test_helper"

class Public::RecordCoffeesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_record_coffees_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_record_coffees_edit_url
    assert_response :success
  end

  test "should get new" do
    get public_record_coffees_new_url
    assert_response :success
  end
end
