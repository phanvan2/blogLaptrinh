class ArticlesController < ApplicationController
  def index
    @blogs_update = Blog.order(created_at: :desc).take(6)
    @blogs_popular = Blog.order(created_at: :asc).take(6)
    @blogs_demo = Blog.order(created_at: :desc).take(3)
  end
end
