Feature: Student Team Submit User Stories
    As a student team
    So that my work can be graded
    I want to submit my user stories (and comments) for each iteration deadline
    
Background: On Iteration Submission Page
    Given the student team "Lazy Students" exists
    And my student team is "Lazy Students"
    And I am on the iteration submission page

Scenario:
    When I input my user story: "This is a user story."
    And I input my comment: "This is a comment."
    And I press "Submit User Story"
    Then I should be on the profile page for my student team
    And I should see "This is a user story."
    And I should see "This is a comment."