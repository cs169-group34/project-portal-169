Feature: GSI registration
    As a GSI
    So that I can manage teams
    I want to make an account

Background: on GSI registration page
    Given I am in GSI registration page
    
Scenario:
    When I input my email
    And I input my password
    And I press "submit"
    Then I should be on the profile page
    Then I should see my name
