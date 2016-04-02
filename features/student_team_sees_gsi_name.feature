Feature: Student Team sees GSI Name
    As a student team
    So that I know what section I was assigned to
    I want to see the name of my GSI on my profile page
    
Background: 
    Given I have a student team named "Lazy Students" 
    Given the following instructors exist:
    | name | email        | team_name     |
    | GSI1 | GSI1@GSI.edu | Lazy Students |
    And I am logged in as my student team
    
Scenario: See GSI name on group profile page
    Given I am on the profile page for the student team: "Lazy Students"
    Then I should see "GSI1"
    Then I should see "GSI1@GSI.edu"