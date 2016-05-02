Feature: Add Course Feature
  
  As a user
  So that I can Add a Course
  I want to Add a new Course
  
Background: user in database
  
  Given the following users exist:
  | username| password |
  | talha   | 123      |
  Given that "talha" is logged in
  
  Scenario: Add a New Course
      Then I should see "Welcome talha"
      And  I should see "Add a Course"
      When I follow "Add a Course"
      Then I should see "Enter Details."
      When I fill in "course_coursecode" with "CS-200"
      And  I select "01" from "course_time1_4i"
      And  I select "02" from "course_time2_4i"
      And  I check "days_Monday"
      And  I select "Auditorium A-2" from "course_venue"
      And  I press "Save"
      Then I should see "Course Added"