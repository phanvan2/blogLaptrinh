class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]

  # GET /blogs or /blogs.json
  def index
  
	limit = 8
	start = 0
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
  end

  # GET /blogs/1 or /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs or /blogs.json
  def create
    if session[:current_user_id] 
      idUser = session[:current_user_id] 
      idCategory = blog_params[:idCategory]
      title = blog_params[:title] 
      abstract = blog_params[:abstract] 
      content = blog_params[:content]
      img = blog_params[:img]

      status = 0 
      @blog = Blog.new(idUser:idUser,idCategory: idCategory,title: title, abstract: abstract,content: content,img: img,status: status)

      respond_to do |format|
        if @blog.save
          format.html { redirect_to @blog, alert: idCategory }
          format.json { render :show, status: :created, location: @blog }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @blog.errors, status: :unprocessable_entity }
        end
      end
    else 
      redirect_to "/blogs/new"
     
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :abstract, :content, :img,:idCategory )
    end
end
