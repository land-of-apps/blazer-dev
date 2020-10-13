#@javascript
Feature: Visit Dashboard

Scenario: User Visits a Dashboard
    

Scenario: User Runs a Check
    Given I am on checks page
    When I click "Run Now"
    Then I should see the query passing
