class ApplicationController < ActionController::Base
  before_action :authorized
  before_action :current_dude, only: [:index,:show,:create,:new]

  helper_method :logged_in?

def authorized
  unless logged_in?
    redirect_to login_path
  end
end

  def logged_in?
    !!current_user
  end

  def current_user
      if session[:user_id]
       @current_user = User.find(session[:user_id])
     end
  end


  def current_dude
      @user= current_user
  end
end
