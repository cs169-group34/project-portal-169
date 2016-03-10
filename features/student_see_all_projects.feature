Feature: student see all projects
    As a student team
    So I can pick a project
    I want to see a list of all projects

Background: on home page
    Given I am on the home page
    
Scenario:
    When I follow "Project List"
    Then I should be on the project list page
    And I should see the list of projects