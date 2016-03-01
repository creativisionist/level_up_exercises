Feature: Search Meals
As a user
I want to find the favorite meals of my friends
In order to decide what to eat

  Background:
    Given there is another user
    And that user has favorites

    Scenario: Viewing others' favorites
      Given I have a valid account
      And I am logged in
      When I search that user
      Then I can see their favorites
