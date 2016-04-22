Feature: As the Admin
    So that I can manage each iteration of the course
    I want to be able to create a New Semester
    
Background: on admin settings page
    Given I am on the admin settings page
    Given I am currently in the semester: "Fa16"
    
Scenario:
    When I press "Create New Semester"
    Then I should be on the admin controls page
    When I press "Course Logistics"
    Then I should be on the course logistics page
    And I should see "Sp17"