Feature: Student sees Projects without Account
    As a Student without an account
    So that I can see projects in advance
    I want to be able to view the Project List

Background:
    
Given the following projects exist:
    | title            | content          | student_team  |
    | Sample Project 1 | Sample Content 1 |               |
    | Sample Project 2 | Sample Content 2 |               |

Scenario: Student without an account sees the Project List
    When I am on the project list page
    Then I should see "Sample Project 1"
    And I should see "Sample Content 1"
    And I should see "Sample Project 2"
    And I should see "Sample Content 2"