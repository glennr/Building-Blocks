require 'faker'
require 'factory_girl/syntax/sham'

Sham.first_name     { Faker::Name.first_name }
Sham.likes          { Faker::Lorem.sentence }
Sham.gender         { ["M","F"][rand(2)] }

Factory.define :child, :class => Child do |f|
  f.first_name { Sham.first_name }
  f.likes { Sham.likes }
  f.gender { Sham.gender }
end