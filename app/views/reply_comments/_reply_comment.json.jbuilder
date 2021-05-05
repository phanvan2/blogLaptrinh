json.extract! reply_comment, :id, :idUser, :idComment, :content, :created_at, :updated_at
json.url reply_comment_url(reply_comment, format: :json)
