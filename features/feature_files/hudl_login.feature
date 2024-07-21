Feature: Hudl login flow feature
  Scenario: Verify successful sign-in to Hudl
    Given I open the Hudl website
    And I select login for Hudl
    When I input the correct email
    And I input the correct password
    And I click on Continue button
    Then I should see the dashboard

  Scenario: Verify empty email and password error messages
    Given I open the Hudl website
    And I select login for Hudl
    When I input empty email
    And I input incorrect password
    And I click on Continue button
    Then I should get red color for errors in email
    And I should get required fields error message
    When I refresh the login page
    And I input incorrect email
    And I input empty password
    And I click on Continue button
    Then I should get red color for errors in password
    And I should get required fields error message
    When I refresh the login page
    And I input empty email
    And I input empty password
    And I click on Continue button
    Then I should get red color for errors in email
    Then I should get red color for errors in password
    And I should get required fields error message

  Scenario: Verify incorrect email and password error messages
    Given I open the Hudl website
    And I select login for Hudl
    When I input incorrect email
    And I input the correct password
    And I click on Continue button
    Then I should get incorrect email or password error message
    When I refresh the login page
    And I input the correct email
    And I input incorrect password
    And I click on Continue button
    Then I should get incorrect email or password error message
    When I refresh the login page
    And I input incorrect email
    And I input incorrect password
    And I click on Continue button
    Then I should get incorrect email or password error message

  Scenario: Verify forgot password flow
    Given I open the Hudl website
    And I select login for Hudl
    When I click on forgot password link
    Then I verify forgot password page elements
    When I input invalid email in forgot password
    And I click on Continue button in forgot password
    Then I should get invalid email error message
    When I refresh the forgot password page
    When I click on forgot password link
    And I input valid email in forgot password
    And I click on Continue button in forgot password
    Then I should see email confirmation screen

  Scenario: Verify other login methods load correct login pages
    Given I open the Hudl website
    And I select login for Hudl
    When I click on facebook login
    Then I verify facebook login page
    When I click on google login
    Then I verify google login page
    When I click on apple login
    Then I verify apple login page

