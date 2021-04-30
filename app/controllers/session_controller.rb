class SessionController < ApplicationController
    ActionController::InvalidAuthenticityToken
    def index 
     
    end
    def create
        @user = User.find_by(email:login_params[:email])
        if @user && @user.password_digest == login_params[:password] 
            session[:current_user_id] = @user.id
             redirect_to "/", alert: "Đăng nhập thành công "
        else
         
             flash[:notice] = "Mời bạn nhập lại ."
             redirect_to '/login' , alert: "Email hoặc mật khẩu ko đúng!"
           
        end
    end
    def destroy 
        
        session.delete(:current_user_id)
        redirect_to "/"
    end

    private 
        def login_params
            params.permit(:email, :password)
        end
end
