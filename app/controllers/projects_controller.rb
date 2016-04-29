class ProjectsController < ApplicationController
    
    def index
      super
      @projects = Project.all
    end
    
    def edit
      if has_edit_permission?
        @project = Project.find(params[:id])
      else
        return render body: "You shouldn't be looking at this page."
      end
    end
    
    def update
      @project = Project.find(params[:id])
      @project.title = project_params[:title]
      @project.content = project_params[:content]
      @project.save!
      redirect_to(project_path(@project))\
    end
    
    def create
      @customer = Customer.find_by(email: customer_params[:email], password: customer_params[:password])
      if @customer == nil
        return render body: "Invalid login credentials"
      else
        @project = Project.create(project_params)
        @customer.projects<<@project
        @customer.save!
        redirect_to(project_path(@project))
      end
    end
    
    def show
      @project = Project.find_by_id(params[:id])
      if @project != nil
        @customer = @project.customer || Customer.new(name: "Undefined")
        @student_team = @project.student_team || StudentTeam.new(name: "Unassigned")
        @is_instructor = logged_in_as_instructor
        @is_assigned_msg = "Status: " + if @project.assigned then 'Assigned' else 'Unassigned' end
      else
        return render body: "You shouldn't be looking at this page."
      end
    end
    
    def assign
      @project = Project.find(params[:id])
      student_team_name = params[:assign][:student_team]
      student_team = StudentTeam.find_by_name(student_team_name)
      if student_team_name and student_team != nil
        student_team.project = @project
        @project.assigned = true
        student_team.save!
      elsif student_team_name == "Unassigned" and @project.student_team != nil
        st = @project.student_team
        st.project= nil
        st.save!
        @project.assigned = false
      end
      @project.save!
      redirect_to(project_path(@project))
    end
    
    private
    
    def project_params
      params.require(:project).permit(:title, :content) 
    end
    
    def customer_params
      params.require(:customer).permit(:name, :email, :password)
    end
    
    #--------------------------------------------------------------------------
    # * Permissions
    #--------------------------------------------------------------------------
    
    def logged_in_as_instructor
      return session[:user_type] == 2
    end
    
    def can_edit_project?
      return true if logged_in_as_instructor
      project = Project.find(project_params[:id])
      if project == nil
        return false
      end
      if project.customer == nil
        return false
      end
      if project.customer.email != customer_params[:email]
        return false
      end
      if project.customer.password != customer_params[:password]
        return false
      end
      return true
    end
    
    def has_edit_permission?
      return true if logged_in_as_instructor
      project = Project.find(params[:id])
      return false if project == nil
      customer = project.customer
      return false if customer == nil
      return true if logged_in_as_customer(customer)
      return false
    end
    
    def logged_in_as_customer(customer)
      return false if session[:user_type] != 4
      return false if session[:user_id] != customer.id
      return true
    end
  
end