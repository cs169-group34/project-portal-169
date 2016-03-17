class WelcomeController < ApplicationController
  
  def index
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
