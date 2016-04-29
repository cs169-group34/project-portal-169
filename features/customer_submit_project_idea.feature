Feature: customer submit project idea
    As a customer
    So that the class can work on my idea
    I want to submit my project idea

Background: on customer project submit page
    Given I have a customer named "Great Customer"
    Given I am on the project submit page
    
Scenario: Good path
    When I input my project title: "Awesome Project"
    And I input my project content: "Not really so awesome."
    And I input my login email: "default_email"
    And I input my login password: "default_password"
    And I press "Submit Project"
    Then I should be on the project details page for project with name: "Awesome Project"
    And I should see "Awesome Project"
    And I should see "Not really so awesome."
    And I should see "From Customer: Great Customer"

Scenario: Sad path
    When I input my project title: "Awesome Project"
    And I input my project content: "Not really so awesome."
    And I input my login email: "Invalid_customer@gmail.com"
    And I input my login password: "justapassword"
    And I press "Submit Project"
    Then I should see "Invalid login credentials"