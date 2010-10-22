Feature: A user wants to manage a list of local agencies
  As a registered user on a paying account
  I want to maintain a list of local agencies
  So that I can determine who can best meet the needs of my clients

  Background: I am logged in as Andy Vanasse
    Given I am a user named Andy Vanasse
    And I am logged in

  Scenario: User searches for an agency with the name Helpers and no match exists
    Given I am on the agencies page
    And no agencies exist with the name "Helpers"
    When I fill in "Search" with "Helpers"
    And I press "Search"
    Then I should see "No agencies"

  Scenario: User adds an agency
    Given I am on the agencies page
    And no agencies exist with the name "Freedom Fellowship"
    When I follow "Add Agency"
    And I fill in "Name" with "Freedom Fellowship"
    And I fill in "Street" with "3075 Locust Hill Rd"
    And I fill in "City" with "Taylors"
    And I fill in "agency_state" with "SC"
    And I fill in "agency_zip_code" with "29687"
    And I fill in "Description" with "Freedom Fellowship is a church whose mission is to help people discover the true freedom that only Jesus Christ can give."
    And I press "Create Agency"
    Then I should see "Freedom Fellowship added"
