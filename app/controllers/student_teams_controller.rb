class StudentTeamsController < ApplicationController
        
    def index
      @student_teams = StudentTeam.all
    end
    
    def new
          
    end
    
    def create
      @student_team = StudentTeam.create(student_team_params)
      redirect_to(student_team_path(@student_team))
    end
    
    def show
       @student_team = StudentTeam.find(params[:id]) 
    end
    
    private
    
    def student_team_params
      params.require(:student_team).permit(:name, :email, :password) 
    end
    
end
