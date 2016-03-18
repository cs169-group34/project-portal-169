Feature: GSI submits public comments
    As a GSI
    So that my student teams can get feedback
    I want to post comments on students’ iteration submissions that the students can see

Background: On Student Profile Page
    Given I have a student team named "Lazy Students"
    And I am on the profile page for the student team: "Lazy Students"
    
Scenario:
    When I input my comment: "Cool Project"
    And I press "Submit"
    Then I should be on the profile page for the student team: "Lazy Students"
    And I should see: "Cool Project"