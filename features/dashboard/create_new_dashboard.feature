#@javascript
Feature: Create new Dashboard

Scenario: User Creates a New Dashboard
    Given I am on "new dashboard" page
    When I fill out "new dashboard" form and click "save"
    Then I should see the result of the dashboard
