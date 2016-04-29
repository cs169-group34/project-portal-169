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
      when 3
        Customer.find(session[:user_id])
      else
        nil
      end
    else
      @current_user = nil
    end
  end
  
  def logged_in_as_student
    return session[:user_type] == 1
  end
  
  def logged_in_as_instructor
    return session[:user_type] == 2
  end
  
  def logged_in_as_customer
    return session[:user_type] == 3
  end
  
end
