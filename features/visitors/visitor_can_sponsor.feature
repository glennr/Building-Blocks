Feature: Visitor can sponsor a child
  In order to increase sponsorship revenue
  As a visitor
  I want to be able to sponsor a particular child

Scenario: "Select a child"
  Given the following children
      | first_name | likes           | gender | birthday    |
      | Vijay      | Soccer, cricket | M      | 3_YEARS_AGO |
  When I go to the child details page for "Vijay"
  And I press "Sponsor Now"
  Then I should be on the sponsorship listing page
  And I should see "Your Sponsorships"
