Feature: List meals
  As a user
  I want to see what meals I have favorited
  In order to decide what to eat

  Background:
    Given I have a valid account
    And I have favorited meals
    And I am logged in

    Scenario: Viewing meals
      When I visit my favorites
      Then I see my favorite meals
