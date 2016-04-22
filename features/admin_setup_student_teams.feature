Feature: As the Admin
    So that I can setup the student teams
    I want to generate a list of student team accounts
    
Background: on admin settings page
    Given I am on the admin settings page
    
Scenario:
    When I follow "Student Teams"
    And I input my desired amount of student teams: "100"
    And I press "Generate Student Teams"
    Then I should see a list of "100" student teams
    And I should see "Export to CSV"