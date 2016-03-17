class LogoutController < ApplicationController
  
  def index
    session.delete(:user_type)
    session.delete(:user_id)
    redirect_to(root_path)
  end
  
end
