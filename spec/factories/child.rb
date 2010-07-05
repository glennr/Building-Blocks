require 'faker'
require 'factory_girl/syntax/sham'

Sham.first_name     { Faker::Name.first_name }
Sham.likes          { ["Soccer, football", "cricket,  Football", "cricket painting"].to_a.random_element }
Sham.gender         { ["M","F"][rand(2)] }
Sham.birthday       { (1..4).to_a.random_element.years.ago.strftime("%Y-%m-%d") }
Sham.picasa_url   { ["http://picasaweb.google.com/robertsgd/C3?authkey=Gv1sRgCJS9yvOi8ubAJA",
                      "http://picasaweb.google.com/robertsgd/C2?authkey=Gv1sRgCIyTg6XG_-ypZQ",
                      "http://picasaweb.google.com/robertsgd/C1?authkey=Gv1sRgCNPMt4Gsgv62owE"][rand(3)] }

Factory.define :child, :class => Child do |f|
  f.first_name { Sham.first_name }
  f.likes { Sham.likes }
  f.gender { Sham.gender }
  f.birthday { Sham.birthday }
  f.picasa_url { Sham.picasa_url }
end