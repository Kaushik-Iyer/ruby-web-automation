Feature: Instagram Login Automation

  Scenario: Login with valid credentials
    Given I am on the Instagram login page
    When I enter my valid credentials
    And I click the login button
    Then I should be logged in to my account

  Scenario: Login with invalid credentials
    Given I am on the Instagram login page
    When I enter my invalid credentials
    And I click the login button
    Then I should see an error message