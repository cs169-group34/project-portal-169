class LoginController < ApplicationController
  
  def login
    email = params[:login_form][:email]
    password = params[:login_form][:password]
    student = StudentTeam.find_by(email: email, password: password)
    instructor = Instructor.find_by(email: email, password: password)
    if student
      login_as_student(student)
    elsif instructor
      login_as_instructor(instructor)
    else
      flash[:notice] = "There is no user asssociated with those login details."
      # Eventually this should redirect to index, and flash an error message
      return redirect_to(action: index)
    end
    # Scan for student team with correct credentials
    redirect_to(root_path)
  end
  
  private
  
  def login_as_student(student)
    session[:user_type] = 1
    session[:user_id] = student.id
  end
  
  def login_as_instructor(instructor)
    session[:user_type] = 2
    session[:user_id] = instructor.id
  end
  
end
