class SearchBlogController < ApplicationController
  def index
    if(params[:idCategory])
      @blogSearch = Blog.where("idCategory LIKE ?", "%"+params[:idCategory]+",%").order(created_at: :desc)
      @count_blog = Blog.where("idCategory = "+ params[:idCategory].to_s).distinct.count(:id)
    elsif ( params[:search])
      # Book.where("name LIKE '%#{params[:search]}%'").order(created_at: :desc)
      @blogSearch =  Blog.where("title LIKE ? ", "%"+params[:search]+"%").order(created_at: :desc)
      @count_blog =  Blog.where("title LIKE ? ", "%"+params[:search]+"%").distinct.count(:id)
    else 
      @blogSearch = Blog.all
      @count_blog = Blog.distinct.count(:id)
    end
  
  end
end
