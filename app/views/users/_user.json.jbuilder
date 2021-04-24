json.extract! user, :id, :username, :email, :password_digest, :quyen, :created_at, :updated_at
json.url user_url(user, format: :json)
