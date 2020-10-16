#@javascript
Feature: Create New Query

Scenario: User Creates a New Query
    Given I am on "new query" page
    When I fill out "new query" form and click "create"
    Then I should see results
