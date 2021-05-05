require "application_system_test_case"

class ReplyCommentsTest < ApplicationSystemTestCase
  setup do
    @reply_comment = reply_comments(:one)
  end

  test "visiting the index" do
    visit reply_comments_url
    assert_selector "h1", text: "Reply Comments"
  end

  test "creating a Reply comment" do
    visit reply_comments_url
    click_on "New Reply Comment"

    fill_in "Content", with: @reply_comment.content
    fill_in "Idcomment", with: @reply_comment.idComment
    fill_in "Iduser", with: @reply_comment.idUser
    click_on "Create Reply comment"

    assert_text "Reply comment was successfully created"
    click_on "Back"
  end

  test "updating a Reply comment" do
    visit reply_comments_url
    click_on "Edit", match: :first

    fill_in "Content", with: @reply_comment.content
    fill_in "Idcomment", with: @reply_comment.idComment
    fill_in "Iduser", with: @reply_comment.idUser
    click_on "Update Reply comment"

    assert_text "Reply comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Reply comment" do
    visit reply_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reply comment was successfully destroyed"
  end
end
