#------------------------------------------------------------------------------
# * General Inputs
#------------------------------------------------------------------------------

When /^(?:|I )input my name: "(.*)"$/ do |name|
  fill_in("name", name)
end

When /^(?:|I )input my email: "(.*)"$/ do |email|
   fill_in("email", email) 
end

When /^(?:|I )input my password: "(.*)"$/ do |password|
  fill_in("password", password)
end


#------------------------------------------------------------------------------
# * Student Team Inputs
#------------------------------------------------------------------------------

When /^(?:|I )input my team name: "(.*)"$/ do |team_name|
  fill_in("team-name", team_name)
end

#------------------------------------------------------------------------------
# * Project Inputs
#------------------------------------------------------------------------------

When /^(?:|I )input my project title: "(.*)"$/ do |project_title|
  fill_in("project-title", project_title)
end

When /^(?:|I )input my project content: "(.*)"$/ do |project_content|
  fill_in("project-content", project_content)
end

When /^(?:|I )should see a list of students$/ do
  
end