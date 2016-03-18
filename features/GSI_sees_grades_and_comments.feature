Feature: GSI sees Grades and Comments
    As a GSI
    So that I can grade efficiently
    I want to see links to all of the comments and grades I entered for each team (can also be on team profile page)

Background: on home page
    Given I am on the home page
    
Scenario:
    When I follow "Comment List"
    Then I should be on the comment list page
    And I should see a list of comments
    And I should see a list of grades