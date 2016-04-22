Feature: As the Admin
    So that I can keep things consistent between semesters
    I want to able to copy a semester's Grading Rubric
    
Background: on admin controls page
    Given I am on the admin controls page
    Given I have the rubric:
    | field_name   | max_score |
    | Code Quality | 10        |
    | Volitality   | 10        |
    
Scenario:
    When I press "Create New Semester"
    Then I should be on the admin controls page
    When I press "Course Logistics"
    Then I should be on the course logistics page
    And I should see the rubric