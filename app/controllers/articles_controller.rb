class ArticlesController < ApplicationController
  def index
    @blogs_update = Blog.where("status = 1 ").order(created_at: :desc).take(6)
    @blogs_popular = Blog.where("status = 1 ").order(created_at: :asc).take(6)
    @blogs_demo = Blog.where("status = 1 ").order(created_at: :desc).take(3)
  end
  def contact 
  end
end
