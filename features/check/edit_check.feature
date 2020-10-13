#@javascript
Feature: Edit Check

Scenario: User Edits a Check
    Given I am on "edit checks" page
    When I fill out "edit check" form and click "save"
    Then I should see the result of the check
