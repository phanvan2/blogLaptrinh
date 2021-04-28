json.extract! blog, :id, :idUser, :idCategory, :title, :abstract, :content, :img, :status, :created_at, :updated_at
json.url blog_url(blog, format: :json)
