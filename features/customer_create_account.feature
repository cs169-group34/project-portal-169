Feature: Customer create Account
    As a Customer
    So that I can edit my project
    I want to be able to create an account
    
Background: on customer project submit page
    Given I am on the customer registration page
    
Scenario: Customer submit project ideas with login credentials
    When I input my customer name: "Great Customer"
    And I input my login email: "great_customer@gmail.com"
    And I input my login password: "gcpass"
    And I press "Create Customer"
    Then I should be on the profile page for the customer: "Great Customer"