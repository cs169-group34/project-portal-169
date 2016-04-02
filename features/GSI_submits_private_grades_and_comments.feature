# This does not work with multiple iterations

Feature: GSI submits private grades and comments
    As a GSI
    So that I can grade my student teams
    I want to enter private grades and comments for each of their iteration submissions

Background: On Student Profile Page
    Given I have a gsi named "ANDYCHEN"
    And I am logged in as my gsi
    And I have a student team named "Lazy Students"
    
    And the following iteration submissions for my student team exist:
    | iteration | stories              | comments                       |
    | 1         | This is a user story | This is a weird comment.       |

    And I am on the profile page for the student team: "Lazy Students"
    
Scenario:
    When I input my comment: "Cool Project"
    And I input my grade: "100"
    And I check "Private"
    And I press "Submit"
    Then I should be on the profile page for the student team: "Lazy Students"
    And I should see "Cool Project"
    Then I should see "Grade: 100/100"
    