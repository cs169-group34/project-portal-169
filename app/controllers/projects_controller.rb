class ProjectsController < ApplicationController
    
    def index
      @projects = Project.all
    end
    
    def new
          
    end
    
    def create
      @project = Project.create(project_params)
      redirect_to(project_path(@project))
    end
    
    def show
      @project = Project.find(params[:id])
      @student_team = @project.student_team || StudentTeam.new(name: "Unassigned")
      @is_instructor = logged_in_as_instructor
    end
    
    def assign
      @project = Project.find(params[:id])
      student_team_name = params[:assign][:student_team]
      student_team = StudentTeam.find_by_name(student_team_name)
      if student_team_name and student_team != nil
        student_team.project = @project
      end
      student_team.save!
      redirect_to(project_path(@project))
    end
    
    private
    
    def project_params
      params.require(:project).permit(:title, :content) 
    end
    
    #--------------------------------------------------------------------------
    # * Permissions
    #--------------------------------------------------------------------------
    
    def logged_in_as_instructor
      return session[:user_type] == 2
    end
end