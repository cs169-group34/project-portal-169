Feature: Student Team sees Project
    As a student team
    So that I know what project I am assigned to
    I want to see what project I was assigned on my profile page
    
Background: 
    Given I have a student team named "Lazy Students"
    Given the following projects exist:
    | title            | content          | student_team  |
    | Sample Project 1 | Sample Content 1 | Lazy Students |
    And I am logged in as my student team
    
Scenario: See project name on group profile page
    Given I am on the profile page for the student team: "Lazy Students"
    Then I should see "Sample Project 1"
    Then I should see "Sample Content 1"