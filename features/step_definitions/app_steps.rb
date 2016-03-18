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

Given /^I have a student team named "(.*)"$/ do |team_name|
  @student_team = StudentTeam.create(name: team_name, 
      email: "default_email", password: "default_password")
end

Given /^I am logged in as my student team$/ do
  visit("/login")
  fill_in("email", with: @student_team.email)
  fill_in("password", with: @student_team.password)
  click_button("Login")
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

When /^I input my iteration user stories: "(.*)"$/ do |user_stories|
  fill_in("iteration_user_stories", with: user_stories)
end

When /^I input my iteration comment: "(.*)"$/ do |comment|
  fill_in("iteration_comments", with: comment)
end

#------------------------------------------------------------------------------
# * Creation Steps (for batch creating objects)
#------------------------------------------------------------------------------

Given /the following (.*?) exist:$/ do |type, table|
  table.hashes.map do |element|
    case type
      when "projects"
        p = Project.create(
          title: element[:title],
          content: element[:content],
        )
        p.studentteam << StudentTeam.find_by_name(element[:student_team])
      when "instructors"
        i = Instructor.create(
          name: element[:name],
          email: element[:email],
          password: "default_password"
        )
        i.studentteam = StudentTeam.find_by_name(team_name)
      when "student teams"
        s = StudentTeam.create(
          name: element[:name], 
          email: element[:email],
          password: "default_password"
        )
        s.instructor = Instructors.find_by_name(element[:gsi])
    end
  end
end