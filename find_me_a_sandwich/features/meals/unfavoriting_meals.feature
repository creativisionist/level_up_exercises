Feature: Unfavoriting meals
  As a user
  I want to unfavorite my meals
  In order to track only the meals I want

  Background:
    Given I have a valid account
    And I am logged in
    And I search a matching ZIP

  Scenario:
    Given I visit a merchant page
    And I favorite a menu item
    When I unfavorite that item
    Then I see the item is no longer a favorite
