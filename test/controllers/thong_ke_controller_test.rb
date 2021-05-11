require "test_helper"

class ThongKeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get thong_ke_index_url
    assert_response :success
  end
end
