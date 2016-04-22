#------------------------------------------------------------------------------
# * General Steps
#------------------------------------------------------------------------------

When /^(?:|I )input my name: "(.*)"$/ do |name|
  fill_in("name", with: name)
end

When /^(?:|I )input my email: "(.*)"$/ do |email|
   fill_in("email", with: email) 
end

When /^(?:|I )input my password: "(.*)"$/ do |password|
  fill_in("password", with: password)
end

#------------------------------------------------------------------------------
# * Student Steps
#------------------------------------------------------------------------------

Given /^(?:|I )have a student team named "(.*)"$/ do |team_name|
  @student_team = StudentTeam.create(name: team_name, 
      email: "default_email", password: "default_password")
end

Given /^(?:|I )am logged in as my student team$/ do
  visit("/login")
  fill_in("email", with: @student_team.email)
  fill_in("password", with: @student_team.password)
  click_button("Login")
end

When /^(?:|I )update my student team$/ do 
  @student_team = StudentTeam.find(@student_team.id)
end

When /^(?:|I )input my team name: "(.*)"$/ do |team_name|
  fill_in("team-name", with: team_name)
end

Then /^(?:|I )should see the list of projects$/ do
  Project.all.each { |project|
    page.should have_content(project.title)
    page.should have_content(project.content)
  }
end

#------------------------------------------------------------------------------
# * Project Link Steps
#------------------------------------------------------------------------------
    
When /^(?:|I )input my GitHub link: "(.*)"$/ do |github_link|
  fill_in("student_team_github_link", with: github_link)
end

When /^(?:|I )input my Heroku link: "(.*)"$/ do |heroku_link|
  fill_in("student_team_heroku_link", with: heroku_link)
end

When /^(?:|I )input my CodeClimate link: "(.*)"$/ do |codeclimate_link|
  fill_in("student_team_codeclimate_link", with: codeclimate_link)
end

When /^(?:|I )input my Pivotal Tracker link: "(.*)"$/ do |pivotal_link|
  fill_in("student_team_pivotal_link", with: pivotal_link)
end

Then /^(?:|I )should see the GitHub link for my student team$/ do
  page.should have_link("GitHub Repository", href: @student_team.github_link)
end

Then /^(?:|I )should see the Heroku link for my student team$/ do
  page.should have_link("Heroku Deployment", href: @student_team.heroku_link)
end

Then /^(?:|I )should see the CodeClimate link for my student team$/ do
  page.should have_link("CodeClimate Analysis", href: @student_team.codeclimate_link)
end

Then /^(?:|I )should see the Pivotal Tracker link for my student team$/ do
  page.should have_link("Pivotal Tracker", href: @student_team.pivotal_link)
end

#------------------------------------------------------------------------------
# * GSI Steps
#------------------------------------------------------------------------------

When /^(?:|I )input my comment: "(.*)"$/ do |comment|
  fill_in("comments", with: comment)
end

When /^(?:|I )input my grade: "(.*)"$/ do |grade|
  fill_in("grades", with: grade)
end

When /^(?:|I )input the secret password$/ do
  fill_in("secretpass", with: Rails.configuration.x.gsi_secretpass)
end

Given /^I have a gsi named "(.*)"$/ do |gsi_name|
  @gsi = Instructor.create(name: gsi_name, 
      email: "default_email", password: "default_password")
end

Given /^I am logged in as my gsi$/ do
  visit("/login")
  fill_in("email", with: @gsi.email)
  fill_in("password", with: @gsi.password)
  click_button("Login")
end

Then /^(?:|I )should see a list of students$/ do
  StudentTeam.all.each { |team|
    page.should have_content(team.name)
    page.should have_content(team.email)
  }
end

Then /^(?:|I )should see a list of comments$/ do
  StudentTeam.all.each { |team|
    page.should have_content(team.comments)
  }
end

Then /^(?:|I )should see a list of grades$/ do
  StudentTeam.all.each { |team|
    page.should have_content(team.grades)
  }
end

#------------------------------------------------------------------------------
# * Customer Steps
#------------------------------------------------------------------------------

When /^(?:|I )input my project title: "(.*)"$/ do |project_title|
  fill_in("project-title", with: project_title)
end

When /^(?:|I )input my project content: "(.*)"$/ do |project_content|
  fill_in("project-content", with: project_content)
end

When /^(?:|I )input my customer name: "(.*)"$/ do |name|
  fill_in("customer_name", with: name)
end

When /^(?:|I )input my login email: "(.*)"$/ do |email|
  fill_in("login-email", with: email)
end

When /^(?:|I )input my login password: "(.*)"$/ do |password|
  fill_in("login-password", with: password)
end

Given /^I have a customer named "(.*)"$/ do |customer_name|
  @customer = Customer.create(name: customer_name, 
      email: "default_email", password: "default_password")
end

Given /^I am logged in as my customer/ do
  visit("/login")
  fill_in("email", with: @customer.email)
  fill_in("password", with: @customer.password)
  click_button("Login")
end

Given /^I pair customer "(.*)" with project "(.*)"$/ do |customer_name, project_name|
  customer = Customer.find_by_name(customer_name)
  project = Project.find_by_name(project_name)
  customer.project = project
  customer.save
  project.save

#------------------------------------------------------------------------------
# * Creation Steps (for batch creating objects)
#------------------------------------------------------------------------------

Given /the following (projects|instructors|student_teams) exist:$/ do |type, table|
  table.hashes.map do |element|
    case type
      when "projects"
        pro = Project.create(
          title: element[:title],
          content: element[:content],
        )
        pro.student_team = StudentTeam.find_by_name(element[:student_team])
        pro.save
      when "instructors"
        i = Instructor.create(
          name: element[:name],
          email: element[:email],
          password: "default_password"
        )
        st = StudentTeam.find_by_name(element[:team_name]) || []
        i.student_teams << st
        i.save
      when "student_teams"
        s = StudentTeam.create(
          name: element[:name], 
          email: element[:email],
          password: "default_password"
        )
        s.instructor = Instructor.find_by_name(element[:gsi])
        s.save
    end
  end
end


#------------------------------------------------------------------------------
# * Iteration Steps
#------------------------------------------------------------------------------

Given /^the following iteration submissions for my student team exist:$/ do |iterations|
  iterations.hashes.each do |iteration|
    @student_team.iterations.create(iteration: iteration['iteration'], 
        user_stories: iteration['stories'], comments: iteration['comments'])
  end
end

Then /^I should see the iteration submission "(.*)" for my student team$/ do |iter_str|
  iter_num = get_iteration_from_string(iter_str)
  @iteration = @student_team.iterations.find_by(iteration: iter_num)
  page.should have_content(iter_str)
end

Then /^I should see the user stories for that submission$/ do
  page.should have_content(@iteration.user_stories)
end

Then /^I should see the team comments for that submission$/ do
  page.should have_content(@iteration.comments)
end

When /^I input my iteration user stories: "(.*)"$/ do |user_stories|
  fill_in("iteration_user_stories", with: user_stories)
end

When /^I input my iteration comment: "(.*)"$/ do |comment|
  fill_in("iteration_comments", with: comment)
end
