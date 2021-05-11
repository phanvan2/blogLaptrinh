class AdminController < ApplicationController
	def index
	end
	def qlBlog
		limit = 8
		start = 0
		if  session[:current_user_id] 
			if User.find_by_id( session[:current_user_id] ).quyen == 1 
				@count_blog =  Blog.count()
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
				@blogs = Blog.order(created_at: :desc).limit(limit).offset(start)
			else 
				redirect_to "/" , alert: "Vui lòng đăng nhập với tư cách quản trị viên"		
			end
		else 
			redirect_to "/" , alert: "Vui lòng đăng nhập với tư cách quản trị viên"		
		end
	end
	def qlUser
		limit = 8
		start = 0
		if  session[:current_user_id] 
			if User.find_by_id( session[:current_user_id] ).quyen == 1 

				@count_user = User.count()
				@total_page  = (@count_user.to_f / limit)

				if (params[:page]) 
					current_page = params[:page]
					if (@count_user.to_f / limit) > (@count_user / limit)
						@total_page = (@count_user / limit) + 1
					else 
						@total_page = (@count_user / limit) 
					end
				start = (current_page.to_i - 1 ) * limit
			
				end
				@users = User.order(created_at: :desc).limit(limit).offset(start)

			else 
				redirect_to "/" , alert: "Vui lòng đăng nhập với tư cách quản trị viên"		
			end
		else 
			redirect_to "/" , alert: "Vui lòng đăng nhập với tư cách quản trị viên"		
		end
		

	end
	def qlCategory
		limit = 8
		start = 0
		if  session[:current_user_id] 
			if User.find_by_id( session[:current_user_id] ).quyen == 1 
			
				
				@count_Category = Category.count()
				@total_page  = (@count_Category.to_f / limit)

				if (params[:page]) 
					current_page = params[:page]
					if (@count_Category.to_f / limit) > (@count_Category / limit)
						@total_page = (@count_Category / limit) + 1
					else 
						@total_page = (@count_Category / limit) 
					end
				start = (current_page.to_i - 1 ) * limit
			
				end
				@categories = Category.order(created_at: :desc).limit(limit).offset(start)
			else 
				redirect_to "/" , alert: "Vui lòng đăng nhập với tư cách quản trị viên"		
			end
		else 
			redirect_to "/" , alert: "Vui lòng đăng nhập với tư cách quản trị viên"		
		end
		
	end
	def qlComment
		limit = 8
		start = 0
		if  session[:current_user_id] 
			if User.find_by_id( session[:current_user_id] ).quyen == 1 
			
				@count_comment = Comment.count()
				@total_page  = (@count_comment.to_f / limit)

				if (params[:page]) 
					current_page = params[:page]
					if (@count_comment.to_f / limit) > (@count_comment / limit)
						@total_page = (@count_comment / limit) + 1
					else 
						@total_page = (@count_comment / limit) 
					end
				start = (current_page.to_i - 1 ) * limit
			
				end
				@comments = Comment.order(created_at: :desc).limit(limit).offset(start)

			else 
				redirect_to "/" , alert: "Vui lòng đăng nhập với tư cách quản trị viên"		
			end
		else 
			redirect_to "/" , alert: "Vui lòng đăng nhập với tư cách quản trị viên"		
		end
	end 
	def thongke 
		if  session[:current_user_id] 
			if User.find_by_id( session[:current_user_id] ).quyen == 1 
				@thongke = []
				categories = Category.all
				@count_blog = Blog.count()
				@count_comment = Comment.count()
				categories.each do |category|
					
					count_blog1 = Blog.where("idCategory LIKE ? OR idCategory LIKE ? ", ""+category.id.to_s+",%" , "%," +category.id.to_s+ ",%").distinct.count(:id)
					@thongke.push([category.name,count_blog1] )
				end
				@count_user = User.count()
			else 
				redirect_to "/" , alert: "Vui lòng đăng nhập với tư cách quản trị viên"		
			end
		else 
			redirect_to "/" , alert: "Vui lòng đăng nhập với tư cách quản trị viên"		
		end
	end
	def update_quyen 
		if  session[:current_user_id] 
			if User.find_by_id( session[:current_user_id] ).quyen == 1 
				status = 1
				status_current = User.find_by_id(params[:id]).quyen
				if status_current === 1  
					status = 0 
				end
				User.find_by_id(params[:id]).update(quyen: status)
				else 
				redirect_to "/" , alert: "Vui lòng đăng nhập với tư cách quản trị viên"		
			end
		else 
			redirect_to "/" , alert: "Vui lòng đăng nhập với tư cách quản trị viên"		
		end
	end

end
