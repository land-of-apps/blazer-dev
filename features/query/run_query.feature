#@javascript
Feature: Run Query

Scenario: User Runs a Query
    Given I am on the homepage
    When I navigate to a query
    Then I should see the results of the query
