Feature: Visitor see sponsor banner
  In order to increase sponsorships
  As a visitor
  I want to be able to see a banner on the homepage

Scenario: "See banner, follow link"
  Given I am on the homepage
  When I click the featured child banner
  Then I should be on the child details page


  

