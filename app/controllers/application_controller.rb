class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  AUTH_MESSAGE = "You are not authorised to view this page."
  
  def index
    set_current_user
    set_profile_path
  end
  
  def set_current_user
    @current_user = nil
    if session[:user_type] and session[:user_id]
      @current_user = case session[:user_type]
      when 1
        StudentTeam.find(session[:user_id])
      when 2
        Instructor.find(session[:user_id])
      when 3
        :admin
      end
    end
  end
  
  def set_profile_path
    if @current_user.is_a?(StudentTeam)
      session[:profile_path] = student_team_path(@current_user)
    elsif @current_user.is_a?(Instructor)
      session[:profile_path] = instructor_path(@current_user)
    elsif @current_user == :admin
      session[:profile_path] = "/admin"
    else
      session[:profile_path] = ""
    end
  end
  
  def logged_in_as_student
    return session[:user_type] == 1
  end
  
  def logged_in_as_instructor
    return session[:user_type] == 2
  end
  
  def logged_in_as_admin
    return session[:user_type] == 3
  end
  
  def display_unauthorized_message
    render body: AUTH_MESSAGE
  end
  
end
