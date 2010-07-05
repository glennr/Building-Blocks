class AddAmountToSponsorship < ActiveRecord::Migration

  def self.up
    add_column :sponsorships, :amount, :decimal, :precision => 15, :scale => 2
  end

  def self.down
    remove_column :sponsorships, :amount
  end

end
