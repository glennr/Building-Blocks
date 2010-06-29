class Child < ActiveRecord::Base
  GENDERS = {
    "M"    => 'male',
    "F"  => 'female'
  }
  GENDERS = {
    "M"    => 'male',
    "F"  => 'female'
  }

  validates_presence_of :first_name, :likes, :gender

  validates_inclusion_of :gender, :in => GENDERS.keys

end