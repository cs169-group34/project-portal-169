Feature: Student Team Submit Links
    As a student team
    So that the GSIs can access our project
    I want to be able to enter links onto my profile page (GitHub, Heroku, CodeClimate, Pivotal Tracker)
    
Background: On Student Edit Profile Page
    Given I have a student team named "Lazy Students"
    And I am logged in as my student team
    And I am on the profile edit page for the student team: "Lazy Students"
    
Scenario:
    When I input my GitHub link: "https://github.com/cs169-group34/project-portal-169"
    And I input my Heroku link: "http://projectportal-169.herokuapp.com/"
    And I input my CodeClimate link: "https://codeclimate.com/github/cs169-group34/project-portal-169"
    And I input my Pivotal Tracker link: "https://www.pivotaltracker.com/n/projects/1549389"
    And I press "Update Project Information"
    
    Then I should be on the profile page for my student team
    And I should see the GitHub link for my student team
    And I should see the Heroku link for my student team
    And I should see the CodeClimate link for my student team
    And I should see the Pivotal Tracker link for my student team