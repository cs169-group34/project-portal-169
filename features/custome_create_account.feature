Feature: Customer create Account
    As a Customer
    So that I can edit my project
    I want to be able to create an account
    
Background: on customer project submit page
    Given I am on the project submit page
    
Scenario: Customer submit project ideas with login credentials
    When I input my project title: "Awesome Project"
    And I input my project content: "Not really so awesome."
    And I input my customer name: "Great Customer"
    And I input my login email: "great_customer@gmail.com"
    And I input my login password: "gcpass"
    And I press "Submit Project"
    Then I should be on the project details page for project with name: "Awesome Project"
    And I should see "Awesome Project"
    And I should see "Not really so awesome."
    When I am on profile page for the customer: "Great Customer"
    Then I should see "Awesome Project"