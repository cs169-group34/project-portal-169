class StudentTeamsController < UserController
        
    def index
      super
      @student_teams = StudentTeam.all
    end
    
    def create
      return if reject_existing_user(params[:student_team][:name])
      @student_team = StudentTeam.create(student_team_params)
      session[:user_type] = 1
      session[:user_id] = @student_team.id
      redirect_to(student_team_path(@student_team))
    end
    
    def edit
      if can_edit_profile_page?(params[:id].to_i)
         @student_team = StudentTeam.find(params[:id])
      else
        return render body: "You shouldn't be looking at this page."
      end
    end
    
    def update
      if can_edit_profile_page?(params[:id].to_i)
        @student_team = StudentTeam.find(params[:id])
        links = [:github_link, :heroku_link, :codeclimate_link, :pivotal_link]
        links.each { |attr|
           @student_team.update_attribute(attr, params[:student_team][attr])
        }
        redirect_to(student_team_path(@student_team))
      else
        return render body: "You shouldn't be looking at this page."
      end
    end
    
    def show
      if access_profile_page?(params[:id].to_i)
         @student_team = StudentTeam.find(params[:id])
         @iterations = @student_team.iterations
         @gsi = @student_team.instructor || Instructor.new(name: "Unassigned", email: "Unassigned")
         @project = @student_team.project || Project.new(title: "Unassigned", content: "Unassigned")
         @is_instructor = logged_in_as_instructor
      else
        return render body: "You shouldn't be looking at this page."
      end
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
      if project_title == "Unassigned" and @student_team.project != nil
        @student_team.project.assigned = false
        @student_team.project.save!
        @student_team.project = nil
      elsif project_title
        @student_team.project = Project.find_by_title(project_title) || @student_team.project
        @student_team.project.assigned = true
        @student_team.project.save!
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
      if params[:grades_and_comments][:private]
        iteration.private_comments = params[:grades_and_comments][:comments]
      else
        iteration.instructor_comments = params[:grades_and_comments][:comments]
      end
      iteration.save!
      return redirect_to(student_team_path(student_team))
    end
    
    private
    
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
