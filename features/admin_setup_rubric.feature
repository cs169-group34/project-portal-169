Feature: As the Admin
    So that I can help GSI's grade iterations
    I want to be able to setup a Grading Rubric
    
Background: on admin controls page
    Given I am on the admin controls page
    
    Given I have the rubric:
    | field_name   | max_score |
    | Code Quality | 10        |
    | Volitality   | 10        |

    Given I have the new rubric:
    | field_name   | max_score |
    | Code Quality | 10        |
    | Volitality   | 10        |
    | Velocity     | 5         |
    
Scenario:
    When I press "Course Logistics"
    Then I should be on the course logistics page
    And I should see the rubric for the class
    When I press "Edit Rubric"
    Then I should be on the rubric editing page
    When I input my rubric
    And I press "Update Rubric"
    Then I should see the new rubric