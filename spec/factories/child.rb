require 'faker'
require 'factory_girl/syntax/sham'

Sham.first_name     { Faker::Name.first_name }
Sham.likes          { ["Soccer, football", "cricket,  Football", "cricket painting"].to_a.random_element }
Sham.gender         { ["M","F"][rand(2)] }
Sham.birthday       { (1..4).to_a.random_element.years.ago.strftime("%Y-%m-%d") }

Factory.define :child, :class => Child do |f|
  f.first_name { Sham.first_name }
  f.likes { Sham.likes }
  f.gender { Sham.gender }
  f.birthday { Sham.birthday }
end