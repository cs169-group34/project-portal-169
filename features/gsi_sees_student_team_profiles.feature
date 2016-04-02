Feature: GSI sees Student Team Profiles
    As a GSI
    So that I can keep track of the progress of my teams
    I want to see links to the profiles of all my teams
    
Background:
    Given I have a gsi named "Best GSI"
    Given the following student_teams exist:
    | name  | email          | gsi      | 
    | team1 | team1@team.edu | Best GSI |
    | team2 | team2@team.edu | Best GSI |
    And I am logged in as my gsi

Scenario: 
    Given I am on the profile page for the GSI with name: "Best GSI"
    When I follow "team1"
    Then I should be on the profile page for the student team: "team1"
    And I should see "team1@team.edu"
    Given I am on the profile page for the GSI with name: "Best GSI"
    When I follow "team2"
    Then I should be on the profile page for the student team: "team2"
    And I should see "team2@team.edu"