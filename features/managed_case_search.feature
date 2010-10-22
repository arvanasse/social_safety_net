Feature: A user wants to search for a case to see if a client is being helped by the agency
  As a registered user on a paying account
  I want to search for a case
  So that I can determine if they are being served by my agency

  Background: I am logged in as Andy Vanasse
    Given I am a user named Andy Vanasse
    And I am logged in

  Scenario: User searches for a case with reference number VAN20100001 and no match exists
    Given I am on the cases page
    And no cases exist with the reference number "VAN20100001"
    When I fill in "Search" with "VAN20100001"
    And I press "Search"
    Then I should see "No cases"

  Scenario: User searches for a case with reference number VAN20100001 and one match exists
    Given I am on the cases page
    And 1 case exists with the reference number "VAN20100001"
    When I fill in "Search" with "VAN20100001"
    And I press "Search"
    Then I should see "1 match"
