Feature: student see all projects
    As a student team
    So I can pick a project
    I want to see a list of all projects

Background: on home page
    Given I am in home page
    
Scenario:
    When I press "submit"
    Then I should be on project list page
    And I should a list of projects