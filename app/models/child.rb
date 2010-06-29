class Child < ActiveRecord::Base
  GENDERS = {
    "M"    => 'male',
    "F"  => 'female' }

  validates_presence_of :first_name, :likes, :gender, :birthday
  validates_inclusion_of :gender, :in => GENDERS.keys

end