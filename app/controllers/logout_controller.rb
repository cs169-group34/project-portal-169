class LogoutController < ApplicationController
  
  def index
    [:user_type, :user_id, :profile_path].each { |sym|
      session.delete(sym)
    }
    redirect_to(root_path)
  end
  
end
