class SearchBlogController < ApplicationController
  def index


 
	limit = 6
	start = 0 ; 
	@count_blog = 1





    if(params[:idCategory])
		@count_blog = Blog.where("idCategory LIKE ? OR idCategory LIKE ? ", ""+params[:idCategory]+",%" , "%," +params[:idCategory]+ ",%").distinct.count(:id)
		@total_page  = (@count_blog.to_f / limit)
		if (params[:page]) 
			current_page = params[:page]
		
			if (@count_blog.to_f / limit) > (@count_blog / limit)
				@total_page = (@count_blog / limit) + 1
			else 
				@total_page = (@count_blog / limit) 
			end
			start = (current_page.to_i - 1 ) * limit
		end
      	@blogSearch = Blog.where("idCategory LIKE ? OR idCategory LIKE ? ", ""+params[:idCategory]+",%" , "%," +params[:idCategory]+ ",%").order(created_at: :desc).limit(limit).offset(start)
     
    elsif ( params[:search])
		@count_blog =  Blog.where("title LIKE ? ", "%"+params[:search]+"%").distinct.count(:id)
		@total_page  = (@count_blog.to_f / limit)
		if (params[:page]) 
			current_page = params[:page]
		
			if (@count_blog.to_f / limit) > (@count_blog / limit)
				@total_page = (@count_blog / limit) + 1
			else 
				@total_page = (@count_blog / limit) 
			end
			start = (current_page.to_i - 1 ) * limit
		end
      # Book.where("name LIKE '%#{params[:search]}%'").order(created_at: :desc)
      @blogSearch =  Blog.where("title LIKE ? ", "%"+params[:search]+"%").order(created_at: :desc).limit(limit).offset(start)

    else 
      @blogSearch = Blog.all
      @count_blog = Blog.distinct.count(:id)
    end
  
  end
end
