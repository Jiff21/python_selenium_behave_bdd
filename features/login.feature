Feature: Tests that should be run on every page

  @browser  @critical
  Scenario: User can login to the site
    Given I am on "index"
    When I click on the Username field
      And I type in "standard_user"
      And I click on the Password field
      And I type in "secret_sauce"
      And I click on the Login Button
      And I wait for the Menu button
    Then the url should contain "/v1/inventory.html"

  @browser  @medium
  Scenario: Validation error when submitting without Username
    Given I am on "index"
    When I click on the Password field
      And I type in "secret_sauce"
      And I click on the Login Button
    Then there should be one validation error
      And the validation error should include "Username is required"

  @browser  @medium
  Scenario: Validation error when submitting without Password
    Given I am on "index"
    When I click on the Username field
      And I type in "standard_user"
      And I click on the Login Button
    Then there should be one validation error
      And the validation error should include "Password is required"

 @browser  @critical
  Scenario: Locked users can't login
    Given I am on "index"
    When I click on the Username field
      And I type in "locked_out_user"
      And I click on the Password field
      And I type in "secret_sauce"
      And I click on the Login Button
    Then there should be one validation error
      And the validation error should include "Sorry, this user has been locked out"

 @browser  @critical
  Scenario: Incorrect Password
    Given I am on "index"
    When I click on the Username field
      And I type in "problem_user"
      And I click on the Password field
      And I type in "wrong password"
      And I click on the Login Button
    Then there should be one validation error
      And the validation error should include "Username and password do not match any user in this service"