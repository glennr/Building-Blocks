class CreateSponsorships < ActiveRecord::Migration
  def self.up
    create_table :sponsorships do |t|
      t.integer :child_id
      t.integer :user_id
      t.integer :purchase_id
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :sponsorships
  end
end