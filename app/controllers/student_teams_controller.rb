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
    
    # Then I should see the iteration submission "Iteration 1-1" for my student team
    # And I should see the user stories for that submission
    # And I should see the team comments for that submission
    
    def show
      @student_team = StudentTeam.find(params[:id])
      @iterations = @student_team.iterations
    end
    
    private
    
    def student_team_params
      params.require(:student_team).permit(:name, :email, :password) 
    end
    
end
