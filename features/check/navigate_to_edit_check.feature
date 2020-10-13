#@javascript
Feature: Navigate to Edit Checks Form

Scenario: User Navigates to Edit Checks Form
    Given I am on "checks" page
    When I click "edit" button
    Then I should see the "edit check" form
