Feature: Login Feature
  
  As a user
  So that I can Login
  I want to go to login page
  
Background: user in database
  
  Given the following users exist:
  | username| password |
  | talha   | 123      |


Scenario: Get to Login Page
  When I am on the home page
  Then I should see "Login"
  When I follow "Login"
  Then I should see "Enter Login Details"
  
Scenario: Authenticate
  When I am on the login page
  And I fill in "Username" with "talha"
  And I fill in "Password" with "123"
  And  I press "Login"
  Then I should see "Welcome talha"
