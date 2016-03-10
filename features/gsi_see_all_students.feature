Feature: GSI see all students
    As a GSI
    So that I can manage student teams
    I want to see a list of all student teams
    
Background: on home page
    Given I am on home page
    
Scenario:
    When I press "Student List"
    Then I should be on student list page
    And I should see a list of students