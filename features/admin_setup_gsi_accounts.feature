Feature: As the Admin
    So that I can let GSIs manage the website
    I want to be able to add GSI accounts

Background: on admin settings page
    Given I am on the admin settings page
    
Scenario:
    When I follow "Instructor Config"
    And I input my desired amount of instructors: "10"
    And I press "Generate Instructor Accounts"
    Then I should see a list of "10" instructors
    And I should see "Export to CSV"