require "test_helper"

class SearchBlogControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get search_blog_index_url
    assert_response :success
  end
end
