Feature: GSI assign Student Teams to GSIs
    As a GSI
    So that students know who their GSI is
    I want to be able to assign each student team to a GSI
    
Background:
    Given I have a gsi named "Best GSI"
    Given the following instructors exist:
    | name | email        | team_name     |
    | GSI1 | GSI1@GSI.edu |               |
    | GSI2 | GSI2@GSI.edu |               |
    Given the following student_teams exist:
    | name  | email          | gsi  | 
    | team1 | team1@team.edu | GSI2 |
    And I am logged in as my gsi
    
Scenario: Assign student team to GSI on student team details page
    When I am on the profile page for the student team: "team1"
    Then I should see "GSI2"
    And I should not see "GSI1"
    When I fill in "assign to instructor" with "GSI1"
    Then I press "Assign"
    Then I should be on the profile page for the student team: "team1"
    And I should see "GSI1"
    And I should not see "GSI2"
    # And I should see "assignment successful!"