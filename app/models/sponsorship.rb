class Sponsorship < ActiveRecord::Base
  #belongs_to :user
  belongs_to :child

  validates_presence_of :child_id

end