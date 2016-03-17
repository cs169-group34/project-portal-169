Feature: Student Team Iteration Submissions
    As a student team
    So that I can keep track of my progress
    I want to see a list of all of my iteration submissions on my profile page
    
Background: On Student Profile Page
    Given I have a student team named "Lazy Students"
    
    And the following iteration submissions for my student team exist:
    | iteration | stories              | comments                       |
    | 1         | This is a user story | This is a weird comment.       |
    | 2         | Another user story   | This is another weird comment. |
    
    And I am on the profile page for the student team: "Lazy Students"
    
Scenario:
    Then I should see the iteration submission "Iteration 1-1" for my student team
    And I should see the user stories for that submission
    And I should see the team comments for that submission
    
    Then I should see the iteration submission "Iteration 1-2" for my student team
    And I should see the user stories for that submission
    And I should see the team comments for that submission