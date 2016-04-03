class InstructorsController < ApplicationController
        
    def index
      @instructors = Instructor.all
    end
    
    def create
      if params[:instructor][:secretpass] != Rails.configuration.x.gsi_secretpass
        flash[:notice] = Rails.configuration.x.gsi_secretpass_incorrect
        return redirect_to(action: 'new')
      end
      @instructor = Instructor.create(instructor_params)
      redirect_to(instructor_path(@instructor))
    end
    
    def show
      @instructor = Instructor.find(params[:id]) 
      @student_teams = @instructor.student_teams
    end
    
    private
    
    def instructor_params
      params.require(:instructor).permit(:name, :email, :password) 
    end
    
end
