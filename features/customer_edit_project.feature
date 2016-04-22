Feature: Customer edit Project
    As a Customer
    So that I can fix my project submission
    I want to be able to edit my project

Background:
    Given the following projects exist:
    | title            | content          | student_team  |
    | Sample Project 1 | Sample Content 1 |               |
    Given I have a customer named "Great Customer"
    Given I pair customer "Great Customer" with project "Sample Project 1"
    Given I am logged in as my customer
    
Scenario:
    When I am on the edit page for project: "Sample Project 1"
    Then I should see "Sample Project 1"
    And I should see "Sample Content 1"
    Given I am on the profile page for the customer: "Great Customer"
    Then I should see "Sample Project 1"
    When I follow "Sample Project 1"
    Then I should be on the edit page for project: "Sample Project 1"
    When I input my project title: "New Title"
    And I input my project content: "New Content."
    And I press "Submit Changes"
    Then I should be on the project details page for project with name: "New Title"
    And I should see "New Title"
    And I should see "New Content."
    And I should not see "Sample Project 1"
    And I should not see "Sample Content 1"