class LoginController < ApplicationController
  
  def login
    # originally email. Want to change it back to email to make the tests pass again?
    username = params[:login_form][:username]
    password = params[:login_form][:password]
    return if login_as_student_team(username, password) 
    return if login_as_instructor(username, password)
    return if login_as_admin(username, password)
    return if login_as_customer(username, password)
    flash[:notice] = "There is no user associated with these login details."
    redirect_to(action: "index")
  end
  
  private
  
  def login_as_student_team(username, password)
    student_team = StudentTeam.find_by(name: username, password: password)
    if student_team
      session[:user_type] = 1
      session[:user_id] = student_team.id
      redirect_to(root_path)
      return true
    end
    return false
  end
  
  def login_as_instructor(username, password)
    instructor = Instructor.find_by(name: username, password: password)
    if instructor
      session[:user_type] = 2
      session[:user_id] = instructor.id
      redirect_to(root_path)
      return true
    end
    return false
  end
  
  def login_as_admin(username, password)
    if username == Rails.configuration.x.admin_username and
        password == Rails.configuration.x.admin_password
      session[:user_type] = 3
      session[:user_id] = 1
      redirect_to(root_path)
      return true
    end
    return false
  end
  
  def login_as_customer(username, password)
    customer = Customer.find_by(name: username, password: password)
    if customer
      session[:user_type] = 4
      session[:user_id] = customer.id
      redirect_to(root_path)
      return true
    end
    return false
  end
  
end
