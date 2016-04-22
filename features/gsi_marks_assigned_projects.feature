Feature: GSI marks Assigned Projects
    As a GSI
    So that I can keep track of projects
    I want to be able to mark them as assigned
    
Background:
    Given I have a gsi named "Best GSI"
    Given the following instructors exist:
    | name | email        | team_name     |
    | GSI1 | GSI1@GSI.edu | Lazy Students |
    | GSI2 | GSI2@GSI.edu | Lazy Students |
    Given the following student_teams exist:
    | name  | email          | gsi  | 
    | team1 | team1@team.edu | GSI2 |
    Given the following projects exist:
    | title            | content          | student_team  |
    | Sample Project 1 | Sample Content 1 |               |
    And I am logged in as my gsi
    
Scenario: Assign project to student team on project details page
    When I am on the project details page for project with name: "Sample Project 1"
    Then I should see "Status: Unassigned"
    When I fill in "assign to student_team" with "team1"
    And I press "Assign"
    Then I should be on the project details page for project with name: "Sample Project 1"
    And I should see "Status: Assigned"
    
Scenario: Assign student team to project on student team details page
    When I am on the project details page for project with name: "Sample Project 1"
    Then I should see "Status: Unassigned"
    When I am on the profile page for the student team: "team1"
    Then I fill in "assign to project" with "Sample Project 1"
    And I press "Assign"
    Then I should be on the profile page for the student team: "team1"
    When I am on the project details page for project with name: "Sample Project 1"
    Then I should see "Status: Assigned"