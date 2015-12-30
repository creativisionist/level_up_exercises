Feature: Error page

  Scenario: Get a 404 page
    When I go to a page that does not exist
    Then I should get a 404 page
