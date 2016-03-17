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

<<<<<<< HEAD
Given /^I have a student team named "(.*)"$/ do |team_name|
  @student_team = StudentTeam.create(name: team_name, 
      email: "default_email", password: "default_password")
=======
Given /^the student team "(.*)" exists$/ do |team_name|
  Student.create()
end

Given /^my student team is "(.*)"$/ do |team_name|
  @student = Student.find_by(name: team_name)
>>>>>>> d5ab2f69dd777af4f44c22f24a6c91b72450dd11
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
# * GSI Steps
#------------------------------------------------------------------------------

Then /^(?:|I )should see a list of students$/ do
  StudentTeam.all.each { |team|
    page.should have_content(team.name)
    page.should have_content(team.email)
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