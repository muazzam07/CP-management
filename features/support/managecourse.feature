Feature: Manage Course Feature
  
  As a user
  So that I can Manage a Course
  I want to Manage it
  
Background: user in database
  
  Given the following users exist:
  | username| password |
  | talha   | 123      |
  
  Given that "talha" is logged in
  Given the course "CS-200" exists
  
  Scenario: Select a Course
    When I am on the managecourse page
    Then I should see "Select Course Code"
    When I select "CS-200" from "param_name"
    And I press "Submit"
    Then I should see "Course Page"
    
  Scenario: Delete course
    Given the course "CS-200" is selected
    And I follow "Delete This Course"
    Then I should see "Course Deleted"
    
  Scenario: Edit course
    Given the course "CS-200" is selected
    And   I follow "Edit This Course"
    Then  I should see "Enter Details."
    When  I check "days_Tuesday"
    And   I press "Save"
    Then  I should see "Course Added"
    When  I follow "Manage a Course"
    And   I select "CS-200" from "param_name"
    And   I press "Submit"
    Then  I should see "Tuesday"
    