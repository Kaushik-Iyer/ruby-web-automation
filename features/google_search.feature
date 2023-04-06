Feature: Google Search
  As a user
  I want to search for a keyword on Google
  So that I can find relevant information

  Scenario: Search for a keyword
    Given I am on the Google homepage
    When I search for "ruby automation"
    Then I should see search results