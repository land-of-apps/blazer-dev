#@javascript
Feature: Run Check

Scenario: User Runs a Check
    Given I am on "checks" page
    When I click "run now" button
    Then I should see the result of the check
