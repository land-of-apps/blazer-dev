#@javascript
Feature: Create New Check

Scenario: User Creates a New Check
    Given I am on "new checks" page
    When I fill out "new check" form and click "save"
    Then I should see the result of the check
