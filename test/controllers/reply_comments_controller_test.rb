require "test_helper"

class ReplyCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reply_comment = reply_comments(:one)
  end

  test "should get index" do
    get reply_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_reply_comment_url
    assert_response :success
  end

  test "should create reply_comment" do
    assert_difference('ReplyComment.count') do
      post reply_comments_url, params: { reply_comment: { content: @reply_comment.content, idComment: @reply_comment.idComment, idUser: @reply_comment.idUser } }
    end

    assert_redirected_to reply_comment_url(ReplyComment.last)
  end

  test "should show reply_comment" do
    get reply_comment_url(@reply_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_reply_comment_url(@reply_comment)
    assert_response :success
  end

  test "should update reply_comment" do
    patch reply_comment_url(@reply_comment), params: { reply_comment: { content: @reply_comment.content, idComment: @reply_comment.idComment, idUser: @reply_comment.idUser } }
    assert_redirected_to reply_comment_url(@reply_comment)
  end

  test "should destroy reply_comment" do
    assert_difference('ReplyComment.count', -1) do
      delete reply_comment_url(@reply_comment)
    end

    assert_redirected_to reply_comments_url
  end
end
