class StudentTeamsController < ApplicationController
        
    def index
      @student_teams = StudentTeam.all
    end
    
    def new
          
    end
    
    def create
      @student_team = StudentTeam.create(student_team_params)
      session[:user_type] = 1
      session[:user_id] = @student_team.id
      redirect_to(student_team_path(@student_team))
    end
    
    def edit
      if can_edit_profile_page?(params[:id].to_i)
         @student_team = StudentTeam.find(params[:id])
      else
        return render body: "You shouldn't be looking at this page."
      end
    end
    
    def update
      if can_edit_profile_page?(params[:id].to_i)
        @student_team = StudentTeam.find(params[:id])
        links = [:github_link, :heroku_link, :codeclimate_link, :pivotal_link]
        links.each { |attr|
           @student_team.update_attribute(attr, params[:student_team][attr])
        }
        redirect_to(student_team_path(@student_team))
      else
        return render body: "You shouldn't be looking at this page."
      end
    end
    
    def show
      if access_profile_page?(params[:id].to_i)
         @student_team = StudentTeam.find(params[:id])
         @iterations = @student_team.iterations
      else
        return render body: "You shouldn't be looking at this page."
      end
    end
    
    def new_story
      if can_edit_profile_page?(params[:id].to_i)
        @student_team = StudentTeam.find(params[:id])
      else
        return render body: "You shouldn't be looking at this page."
      end
    end
    
    def create_story
      @student_team = StudentTeam.find(session[:user_id])
      params[:iteration][:iteration] = get_next_iteration
      @student_team.iterations.create(iteration_params)
      return redirect_to(student_team_path(@student_team))
    end
    
    private
    
    #--------------------------------------------------------------------------
    # * Student Team Creation
    #--------------------------------------------------------------------------
    
    def student_team_params
      params.require(:student_team).permit(:name, :email, :password) 
    end
    
    #--------------------------------------------------------------------------
    # * Iteration Creation
    #--------------------------------------------------------------------------
    
    def iteration_params
      params.require(:iteration).permit(:iteration, :user_stories, :comments)
    end
    
    def get_next_iteration
      next_iteration = 1
      @student_team.iterations.each { |iteration|
        next_iteration = iteration + 1 if iteration >= next_iteration
      }
      return next_iteration
    end
    
    #--------------------------------------------------------------------------
    # * Permissions
    #--------------------------------------------------------------------------
    
    def logged_in_as_student
      return session[:user_type] == 1
    end
    
    def logged_in_as_instructor
      return session[:user_type] == 2
    end
    
    def access_profile_page?(id)
      return true if logged_in_as_instructor 
      return can_edit_profile_page?(id)
    end
    
    def can_edit_profile_page?(id)
      return (logged_in_as_student and session[:user_id] == id)
    end
    
end
