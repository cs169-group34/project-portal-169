class ProjectsController < ApplicationController
    
    def index
      super
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
    end
    
    private
    
    def project_params
      params.require(:project).permit(:title, :content) 
    end
    
end