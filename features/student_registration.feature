Feature: student registration
    As a student team
    So we can do our project
    We want to make an account

Background: on student registration page
    Given I am in student registration page
    
Scenario:
    When I input my email
    And I input my password
    And I press "submit"
    Then I should be on the profile page
    Then I should see my name