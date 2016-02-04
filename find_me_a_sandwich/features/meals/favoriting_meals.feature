Feature: Favoriting meals
  As a user
  I want to favorite my meals
  In order to find them later

  Background:
    Given I have a valid account
    And I am logged in
    And I search a matching ZIP
    And I visit a merchant page

  Scenario:
    Given I see that merchant's menus
    When I favorite a menu item
    And I visit my favorites
    Then the item is added to my favorites
