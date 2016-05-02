Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    User.create!(user)
  end
end

Given /that "(.*)" is logged in/ do |user|
  steps %Q{
    Given I am on the login page
    And I fill in "Username" with "talha"
    And I fill in "Password" with "123"
    And I press "Login"
  }
end

Given /the course "(.*)" exists/ do |course|
  steps %Q{
    Given I am on the addcourse page
    When I fill in "course_coursecode" with "CS-200"
    And  I select "01" from "course_time1_4i"
    And  I select "02" from "course_time2_4i"
    And  I check "days_Monday"
    And  I select "Auditorium A-2" from "course_venue"
    And  I press "Save"
  }
end


Given /the course "(.*)" is selected/ do |course|
  steps %Q{
    Given I am on the managecourse page
    When I select "CS-200" from "param_name"
    And I press "Submit"
  }
end