class InstructorsController < UserController
        
    def index
      @instructors = Instructor.all
    end
    
    def show
      @instructor = Instructor.find(params[:id]) 
      @student_teams = @instructor.student_teams
    end

end
