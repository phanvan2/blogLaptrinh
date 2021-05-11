class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index

    
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    limit = 6
    start = 0
    @count_blog = Blog.where("idUser = "+ params[:id].to_s).distinct.count(:id)
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

   
    @blogs_user = Blog.where("idUser = " +params[:id].to_s).order(created_at: :desc).limit(limit).offset(start)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    
    if user_params[:password_digest] === user_params[:Repass] 
      count = User.where("email = ?" ,user_params[:email]).count()
      if count  < 1
        user = User.find_by(username:user_params[:username])
        if user 
          redirect_to '/register'
        end
        @user = User.new(username: user_params[:username] , email: user_params[:email], password_digest: user_params[:password_digest], quyen: 0, img_user: user_params[:img_user])
        respond_to do |format|
          if @user.save
            format.html { redirect_to @user, alert: "User was successfully created." }
            format.json { render :show, status: :created, location: @user }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      else 
        redirect_to '/register' , alert: "Email đã tồn tại"
      end
    else 
      redirect_to '/register' , alert: "Mật khẩu Không trùng khớp"
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(username:user_params[:username] , email:user_params[:email] , img_user:user_params[:img_user] )
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to "/admin/user?page=1" , notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def login 
    @user = User.all

  end
  def register 
  end 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :password_digest, :quyen, :img_user, :Repass)
    end
end
