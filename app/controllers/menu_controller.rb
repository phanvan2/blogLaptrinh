class MenuController < ApplicationController
  def index
    if session[:current_user_id]
      @current_user_id = User.find_by_id(session[:current_user_id])
      redirect_to '/register'
    end
  end
end
