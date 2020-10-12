#@javascript
Feature: Visit Homepage

Scenario: User Visits the Homepage
    Given I am on the homepage
    Then I should see a search bar
    Then I should see a list of queries
    Then I should see a button to create a new query
