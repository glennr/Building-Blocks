require 'faker'
require 'factory_girl/syntax/sham'

Factory.define :sponsorship, :class => Sponsorship do |f|
  f.child_id { 1 }
end

Factory.define :invalid_sponsorship, :class => Sponsorship do |f|
end