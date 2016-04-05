Feature: GSI registration
    As a GSI
    So that I can manage teams
    I want to make an account

Background: on GSI registration page
    Given I am on the GSI registration page
    
Scenario:
    When I input my name: "Cool GSI"
    And I input my email: "bestgsi@berkeley.edu"
    And I input my password: "secretgsipass"
    And I input the secret password
    And I press "Create New Account"
    Then I should be on the profile page for the GSI with name: "Cool GSI"
    And I should see "Cool GSI"
    And I should see "bestgsi@berkeley.edu"
