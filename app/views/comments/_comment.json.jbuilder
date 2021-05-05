json.extract! comment, :id, :idUser, :idBlog, :content, :created_at, :updated_at
json.url comment_url(comment, format: :json)
