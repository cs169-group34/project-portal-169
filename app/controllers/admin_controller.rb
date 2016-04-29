class AdminController < ApplicationController
  
  def index
    super
    return display_unauthorized_message if not logged_in_as_admin
  end
  
  #----------------------------------------------------------------------------
  # * Semester Controls
  #----------------------------------------------------------------------------
  
  def semester
    return display_unauthorized_message if not logged_in_as_admin
  end
  
  #----------------------------------------------------------------------------
  # * Student Team Controls
  #----------------------------------------------------------------------------
  
  def student_teams
    return display_unauthorized_message if not logged_in_as_admin
    dummy_project = Project.new(title: "Unassigned", content: "Unassigned")
    @student_teams = StudentTeam.all
    @projects = @student_teams.map { |team| team.project || dummy_project }
  end
  
  def generate_student_teams
    return display_unauthorized_message if not logged_in_as_admin
    teams_to_generate = params[:student_team][:amount].to_i
    current_team_count = StudentTeam.count
    if teams_to_generate < 0 or teams_to_generate > 100
      return render body: "Error: Cannot generate #{teams_to_generate} teams."
    end
    create_student_teams(teams_to_generate, current_team_count)
    redirect_to(action: "student_teams")
  end
  
  #----------------------------------------------------------------------------
  # * Instructor Controls
  #----------------------------------------------------------------------------
  
  def instructors
    return display_unauthorized_message if not logged_in_as_admin
    @instructors = Instructor.all
  end
  
  def create_instructor
    return display_unauthorized_message if not logged_in_as_admin
    instructor_hash = instructor_params
    instructor_hash[:password] = generate_random_password
    Instructor.create(instructor_hash)
    redirect_to(action: "instructors")
  end
  
  private
  
  #---------------------------------------------------------------------------
  # * Helper Methods
  #---------------------------------------------------------------------------
  
  def generate_random_password
    return (0...8).map { (65 + rand(26)).chr }.join
  end
  
  def create_student_teams(amount, curr_index)
    amount.times { |i|
      sid = i + curr_index + 1
      name = "Group #{sid}"
      username = "group#{sid}"
      password = generate_random_password
      StudentTeam.create(name: name, username: username, password: password)
    }
  end
  
  def instructor_params
    params.require(:instructor).permit(:name, :email)
  end
  
end
