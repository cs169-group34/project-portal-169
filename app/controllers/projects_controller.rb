class ProjectsController < ApplicationController
    
    def index
      @projects = Project.all
    end
    
    def new
        
    end
    
    def create
      @project = Project.new(project_params)
      @project.save
      redirect_to projects_path
    end
    
    private
    
    def project_params
      params.require(:project).permit(:title, :content) 
    end
    
end