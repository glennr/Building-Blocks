Feature: Visitor see sponsor banner
  In order to increase sponsorships
  As a visitor
  I want to be able to see a banner on the homepage


Scenario: "See banner with child details"
  Given the following children
      | first_name  | likes             |
      | Vijay       | Soccer, cricket |
  When I go to the homepage
  Then I should see "Vijay"
  And I should see "who likes soccer"
  
Scenario: "See banner, follow link"
  Given a child
  And I am on the homepage
  When I click the featured child banner
  Then I should be on the child details page



  

