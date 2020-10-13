#@javascript
Feature: Delete Check

Scenario: User Deletes a Check
    Given I am on "edit checks" page
    When I click "delete" button
    Then I should see the result of the check
