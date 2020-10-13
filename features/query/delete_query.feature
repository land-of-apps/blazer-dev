#@javascript
Feature: Delete Query

Scenario: User Deletes a Query
    Given I am on "edit query" page
    When I click the "delete" button
    Then I should see the results of the query
