Feature: Users can sign up for a paid event
  In order to attend a reunion
  As an authenticated user
  I want to be able to buy a ticket online

  @api @demo
  Scenario: An anonymous user should get a message to login
    When I am on "groups/reunion-2014"
    Then I should see "Please login to register."

  @api @demo
  Scenario: An anonymous user should not have access to e-mails
    When I am on "groups/reunion-2014"
    Then I should not see the link "Attendees"

  @api @demo
  Scenario: An authenticated user is asked to fill in profile before registration
    Given I am logged in as a user with the "authenticated user" role
    When I am on "groups/reunion-2014"
    Then I should see "Please fill in your profile before your registration."

  @api @demo
  Scenario: An authenticated user is redirected to registration after filling in profile information
    Given I am logged in as a user with the "authenticated user" role
    When I am on "groups/reunion-2014"
    When I click "profile"
    When I fill in the following:
      | First Name | My First Name |
      | Last Name | My Last Name |
      | Address 1 | My Address 1 |
      | Postal code | 7100 |
      | City | Vejle |
    And I press "Save"
    Then I should not see "Please set your contact information on your profile page"
    And I should see "Reunion 2014"
