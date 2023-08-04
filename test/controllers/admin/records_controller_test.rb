require "test_helper"

class Admin::RecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_records_index_url
    assert_response :success
  end
end
