Feature: Unfavoriting meals
  As a user
  I want to unfavorite my meals
  In order to track only the meals I want

  Background:
    Given I have a valid account
    And I am logged in

  Scenario:
    When I visit a menu
    And I unfavorite an item
    Then the item is removed from my favorites
