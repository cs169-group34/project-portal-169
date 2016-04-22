Feature: GSI export CSV of Student Groups
    As a GSI
    So that I can keep track of projects
    I want to be able to export them to a CSV file
    
Background: on home page
    Given I have a gsi named "ANDYCHEN"
    And I am logged in as my gsi
    And I am on the home page
    And the following student_teams exist:
    | name  | email          | gsi  | 
    | team1 | team1@team.edu | GSI2 |
    And the following projects exist:
    | title            | content          | student_team  |
    | Sample Project 1 | Sample Content 1 |               |
Scenario:
    When I follow "Export CSV"