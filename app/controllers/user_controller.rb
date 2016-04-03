class UserController < ApplicationController
    
    private
    
    def reject_existing_user(team_name)
      if Instructor.exists?(name: team_name) or 
            StudentTeam.exists?(name: team_name)
        flash[:notice] = "A Student Team or Instructor with this name already exists!"
        redirect_to(action: 'new')
        return true
      end
      return false
    end
    
end