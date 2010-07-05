class Sponsorship < ActiveRecord::Base

  AMOUNTS = {  "€30 monthly"      => 30,
               "€90 quarterly"    => 90,
               "€180 half-yearly" => 180,
               "€360 yearly"      => 360 }

  #belongs_to :user
  belongs_to :child

  validates_presence_of :child_id, :amount
  validates_numericality_of :amount, :in => AMOUNTS.values

end