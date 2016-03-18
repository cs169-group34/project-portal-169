Feature: GSI assign Student Teams to GSIs
    As a GSI
    So that students know who their GSI is
    I want to be able to assign each student team to a GSI
    
Background:
    Given I have a gsi named "Best GSI"
    Given the following instructors exist:
    | name | email        | team_name     |
    | GSI1 | GSI1@GSI.edu | Lazy Students |
    | GSI2 | GSI1@GSI.edu | Lazy Students |
    Given the following students exist:
    | name  | email          | gsi  | 
    | team1 | team1@team.edu | GSI2 |
    And I am logged in as my gsi
    
Scenario:
    Given I am on the profile page for the student team: "team1"
    Then I should see  "GSI2"
    And I should not see  "GSI1"
    When I fill in "assign to GSI" with "GSI1"
    And I press "assign to GSI"
    Then I should be on the profile page for the student team: "team1"
    And I should see  "GSI1"
    And I should not see "GSI2"
    And I should see "assignment successful!"