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

When /^(?:|I )input my team name: "(.*)"$/ do |team_name|
  fill_in("team-name", with: team_name)
end

Then /^(?:|I )should see the list of projects$/ do
  Project.all.each { |project|
    page.should have_content(project.name)
    page.should have_content(project.content)
  }
end

#------------------------------------------------------------------------------
# * GSI Steps
#------------------------------------------------------------------------------

Then /^(?:|I )should see the list of students$/ do
  
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