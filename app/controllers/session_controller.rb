class SessionController < ApplicationController
    ActionController::InvalidAuthenticityToken

    def create
        @user = User.find_by(email:login_params[:email])
        if @user && @user.password_digest == login_params[:password] 
            session[:current_user_id] = @user.id
             redirect_to "/"
        else
            redirect_to '/login'
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
