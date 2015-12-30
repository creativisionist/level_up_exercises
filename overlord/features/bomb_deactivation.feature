Feature: Bomb deactivation
  In order to save Megaton
  As the good Vault Boy
  I want to deactivate the bomb

  Scenario: Visit the active bomb page
    When I am on the active bomb page
    Then I should see instructions and the form to submit the deactivation code

  Scenario: Successful bomb deactivation
    Given I have successfully activated the bomb
    When I input the correct deactivation code
    Then I should be directed to the inactive bomb page
    And the page should contain You've Saved Megaton! For now...

  Scenario: Unsuccessful bomb deactivation
    Given I have successfully activated the bomb
    When I input the incorrect deactivation code
    Then I should be directed to the active bomb page
    And the page should contain The Bomb Is Still Active!

  Scenario: Unsuccessful deactivation leading to explosion
    Given I have successfully activated the bomb
    When I input the incorrect deactivation code max times
    Then I should be directed to the explosion page
