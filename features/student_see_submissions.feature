Feature: Student Team Iteration Submissions
    As a student team
    So that I can keep track of my progress
    I want to see a list of all of my iteration submissions on my profile page
    
Background: On Student Profile Page
    Given the student team "Lazy Students" exists
    And my student team is "Lazy Students"
    
    And the following iteration submissions for my student team exist:
    | name          | stories              | comments                       | 
    | Iteration 1-1 | This is a user story | This is a weird comment.       |
    | Iteration 1-2 | Another user story   | This is another weird comment. |
    
    And I am on the home page
    
Scenario:
    When I follow "Profile Page"
    Then I should be on the profile page for my student team
    
    Then I should see the iteration submission "Iteration 1-1" for my student team
    And I should see the user stories for that submission
    And I should see the team comments for that submission
    
    Then I should see the iteration submission "Iteration 1-2" for my student team
    And I should see the user stories for that submission
    And I should see the team comments for that submission