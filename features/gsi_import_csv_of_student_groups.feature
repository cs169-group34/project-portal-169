Feature: GSI import CSV of Student Groups
    As a GSI
    So that I can more easily upload group information
    I want to upload a CSV of student groups to create the student objects and group objects
    
Background: on home page
    Given I have a gsi named "ANDYCHEN"
    And I am logged in as my gsi
    And I am on the home page
    And the following student_teams exist:
    | name  | email          | gsi  | 
    | team1 | team1@team.edu | GSI2 |
    And the following projects exist:
    | title            | content          | student_team  |
    | Sample Project 1 | Sample Content 1 |             
    And the following CSV string exist: "\"team2\",\"Sample Project 2\""
Scenario:
    When I follow "Import CSV"
    Then I should see "Import.."
    When I follow "Import.."
    Then I should be able to upload
    When I follow "Project List"
    Then I should be on the project list page
    And I should see the list of projects
    And I should see "Sample Project 2"
    And I should see "Team 2"