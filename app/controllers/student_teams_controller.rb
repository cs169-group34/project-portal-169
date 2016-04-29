class StudentTeamsController < UserController
        
    def index
      super
      dummy_project = Project.new(title: "Unassigned", content: "Unassigned")
      @student_teams = StudentTeam.all
      @projects = @student_teams.map { |team| team.project || dummy_project }
    end

    
    def edit
      return display_unauthorized_message if not can_edit_profile_page?(params[:id].to_i)
      identify_student_team
    end
    
    def update
      return display_unauthorized_message if not can_edit_profile_page?(params[:id].to_i)
      @student_team = StudentTeam.find(params[:id])
      attributes = [:name, :github_link, :heroku_link, :codeclimate_link, :pivotal_link]
      attributes.each { |attr|
         @student_team.update_attribute(attr, params[:student_team][attr])
      }
      redirect_to(student_team_path(@student_team))
    end
    
    def show
      return display_unauthorized_message if not access_profile_page?(params[:id].to_i)
      identify_student_team
    end
    
    def new_story
      edit
    end
    
    def create_story
      @student_team = StudentTeam.find(session[:user_id])
      params[:iteration][:iteration] = get_next_iteration
      @student_team.iterations.create(iteration_params)
      return redirect_to(student_team_path(@student_team))
    end
    
    def assign
      @student_team = StudentTeam.find(params[:id])
      project_title = params[:assign][:project]
      if project_title
        @student_team.project = Project.find_by_title(project_title) || @student_team.project
      end
      instructor_name = params[:assign][:instructor]
      if instructor_name
        @student_team.instructor = Instructor.find_by_name(instructor_name) || @student_team.instructor
      end
      @student_team.save!
      return redirect_to(student_team_path(@student_team))
    end
    
    def add_gsi_comments
      student_team = StudentTeam.find(params[:id])
      iteration = student_team.iterations.find(params[:iter_id])
      if params[:grades_and_comments][:grades]
        iteration.instructor_grades = params[:grades_and_comments][:grades]
      end
      if params[:grades_and_comments][:private_comments]
        iteration.instructor_private_comments = params[:grades_and_comments][:private_comments]
      end
      if params[:grades_and_comments][:comments]
        iteration.instructor_comments = params[:grades_and_comments][:comments]
      end
      iteration.save!
      return redirect_to(student_team_path(student_team))
    end
    
    def reset_password
      return display_unauthorized_message if not can_edit_profile_page?(params[:id].to_i)
      identify_student_team
    end
    
    def perform_reset_password
      return display_unauthorized_message if not can_edit_profile_page?(params[:id].to_i)
      student_team = StudentTeam.find(params[:id])
      if params[:student_team][:old_password] != student_team.password
        flash[:notice] = "Error: You entered the incorrect old password."
      elsif params[:student_team][:new_password] != params[:student_team][:confirm_new_password]
        flash[:notice] = "Error: The new passwords that you entered did not match."
      else
        student_team.password = params[:student_team][:new_password]
        student_team.save!
        flash[:notice] = "Your password has been succesfully updated."
      end
      return redirect_to(student_team_path(student_team))
    end
    
    private
    
    #--------------------------------------------------------------------------
    # * Identify Student Team
    #--------------------------------------------------------------------------
    
    def identify_student_team
      @student_team = StudentTeam.find(params[:id])
      @can_edit_profile = can_edit_profile_page?(params[:id])
      @iterations = @student_team.iterations
      @gsi = @student_team.instructor || Instructor.new(name: "Unassigned", email: "Unassigned")
      @project = @student_team.project || Project.new(title: "Unassigned", content: "Unassigned")
      @is_instructor = logged_in_as_instructor
    end
    
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
        next_iteration = iteration.iteration + 1 if iteration.iteration >= next_iteration
      }
      return next_iteration
    end
    
    #--------------------------------------------------------------------------
    # * Permissions
    #--------------------------------------------------------------------------

    def access_profile_page?(id)
      return true if logged_in_as_instructor 
      return can_edit_profile_page?(id)
    end
    
    def can_edit_profile_page?(id)
      return (logged_in_as_student and session[:user_id] == id)
    end
    
end
