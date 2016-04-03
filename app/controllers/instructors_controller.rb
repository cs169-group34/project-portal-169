class InstructorsController < UserController
        
    def index
      @instructors = Instructor.all
    end
    
    def create
      return if reject_existing_user(params[:instructor][:name])
      return if reject_incorrect_secretpass(params[:instructor][:secretpass])
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
    
    def reject_incorrect_secretpass(password)
      if password != Rails.configuration.x.gsi_secretpass
        flash[:notice] = Rails.configuration.x.gsi_secretpass_incorrect
        redirect_to(action: 'new')
        return true
      end
      return false
    end
    
end
