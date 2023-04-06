Feature: Jenkins Login
  As a Jenkins user
  I want to be able to log in to my account
  So that I can access my builds and settings

  Scenario: Successful login
    Given I am on the Jenkins login page
    When I enter my username and password
    And I click the "Log in" button
    And I create a new freestyle project
    Then I should see the new project on the dashboard


