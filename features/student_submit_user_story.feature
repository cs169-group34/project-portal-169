Feature: Student Team Submit User Stories
    As a student team
    So that my work can be graded
    I want to submit my user stories (and comments) for each iteration deadline
    
Background: On Iteration Submission Page
    Given I have a student team named "Lazy Students"
    And I am logged in as my student team
    And I am on the iteration submission page for the student team: "Lazy Students"

Scenario:
    When I input my iteration user stories: "This is a user story."
    And I input my iteration comment: "This is a comment."
    And I press "Submit User Story"
    
    Then I should be on the profile page for the student team: "Lazy Students"
    And I should see "This is a user story."
    And I should see "This is a comment."