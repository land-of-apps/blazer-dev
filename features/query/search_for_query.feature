#@javascript
Feature: Search For Query

Scenario: User Searches For a Query
    Given I am on the homepage
    When I enter a query into the search bar
    Then I should see the results of the query
