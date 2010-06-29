Feature: Visitor see child details
  In order to increase sponsorships
  As a visitor
  I want to be able to see certain non-sensitive details about a child

Scenario: "See banner with child details"
  Given the following children
      | first_name | likes           | gender | birthday    |
      | Vijay      | Soccer, cricket | M      | 3_YEARS_AGO |
  When I go to the child details page for "Vijay"
  Then I should see "Sponsor Vijay"
  And I should see "Age: 3"
  


  

