Feature: Visitor see sponsor banner
  In order to increase sponsorships
  As a visitor
  I want to be able to see a banner on the homepage

Scenario: "See banner with child details"
  Given the following children
      | first_name | likes           | gender | birthday    |
      | Vijay      | Soccer, cricket | M      | 3_YEARS_AGO | 
  When I go to the homepage
  Then I should see "Vijay"
  And I should see "he's a 3 year old boy who likes soccer"

Scenario: "See banner with female child details"
  Given the following children
      | first_name | likes             | gender | birthday    |
      | Suzy       | painting, drawing | F      | 1_YEARS_AGO |
  When I go to the homepage
  Then I should see "Suzy"
  And I should see "she's a 1 year old girl who likes painting"
  
Scenario: "See banner, follow link"
  Given a child
  And I am on the homepage
  When I click the featured child banner
  Then I should be on the child details page




  

