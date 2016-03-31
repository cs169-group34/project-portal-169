class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def index
    set_current_user
  end
  
  def set_current_user
    if session[:user_type] and session[:user_id]
      @current_user = case session[:user_type]
      when 1
        StudentTeam.find(session[:user_id])
      when 2
        Instructor.find(session[:user_id])
      else
        nil
      end
    else
      @current_user = nil
    end
  end
  
end
