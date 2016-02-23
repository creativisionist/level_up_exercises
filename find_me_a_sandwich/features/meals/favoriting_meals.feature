Feature: Favoriting meals
  As a user
  I want to favorite my meals
  In order to find them later

  Background:
    Given I have a valid account
    And I am logged in
    And I search a matching ZIP

  Scenario:
    Given I visit a merchant page
    When I favorite a menu item
    And I visit my favorites
    Then I see the item is a favorite
