Feature: customer submit project idea
    As a customer
    So that the class can work on my idea
    I want to submit my project idea

Background: on customer project submit page
    Given I am in project submit page
    
Scenario:
    When I input my project title
    And I input my project content
    And I press "submit"
    Then I should be on the project details page
    Then I should see my project title