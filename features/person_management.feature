Feature: A user wants to search for a person to see if they have been helped by another agency
  As a registered user on a paying account
  I want to search for a person by name
  So that I can determine if they are being served by another agency

  Background: I am logged in as Andy Vanasse
    Given I am a user named Andy Vanasse
    And I am logged in

  Scenario: User searches for a person with last name Kaufmann and no match exists
    Given I am on the people page
    And no people exist with the last name "Kaufmann"
    When I fill in "Query" with "Kaufmann"
    And I press "Search"
    Then I should see "No people"

  Scenario: User searches for a person with last name Kaufman and one match exists
    Given I am on the people page
    And 1 people exist with the last name "Kaufmann"
    When I fill in "Query" with "Kaufmann"
    And I press "Search"
    Then I should see "1 match"

  Scenario: User searches for a person with name Donnie Kaufman and one match exists
    Given I am on the people page
    And 1 people exist with the name "Donnie Kaufmann"
    When I fill in "Query" with "Donnie Kaufmann"
    And I press "Search"
    Then I should see "1 match"

  Scenario: User searches for a person with name Kaufman, Donnie and one match exists
    Given I am on the people page
    And 1 people exist with the name "Donnie Kaufmann"
    When I fill in "Query" with "Kaufmann, Donnie"
    And I press "Search"
    Then I should see "1 match"
