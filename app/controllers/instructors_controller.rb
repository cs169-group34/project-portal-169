class InstructorsController < ApplicationController
        
    def index
      @instructors = Instructor.all
    end
    
    def new
          
    end
    
    def create
      @instructor = Instructor.new(instructor_params)
      @instructor.save
      redirect_to(instructor_path(@instructor))
    end
    
    def show
       @instructor = Instructor.find(params[:id]) 
    end
    
    private
    
    def instructor_params
      params.require(:instructor).permit(:name, :email, :password) 
    end
    
end
