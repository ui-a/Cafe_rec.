require "test_helper"

class Public::RecordControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_record_index_url
    assert_response :success
  end
end
