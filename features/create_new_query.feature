#@javascript
Feature: Create a New Query

    Scenario: User Creates a new Query
        Given I am on the homepage
        When I click on "New Query"
        Then I should be taken to an html form to create the query
