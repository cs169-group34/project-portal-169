Feature: GSI registration
    As a GSI
    So that I can manage teams
    I want to make an account

Background: on GSI registration page
    Given I am on GSI registration page
    
Scenario:
    When I input my name: "Cool GSI"
    And I input my email
    And I input my password
    And I press "submit"
    Then I should be on profile page
    And I should see "Cool GSI"
