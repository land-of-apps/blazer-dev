#@javascript
Feature: Edit Query

Scenario: User Edits a Query
    Given I am on "edit query" page
    When I modify the query and click the "update" button
    Then I should see the results of the query
