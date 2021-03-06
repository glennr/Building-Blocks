class CreateChildren < ActiveRecord::Migration
  def self.up
    create_table :children do |t|
      t.string  :first_name
      t.string  :likes
      t.string  :gender
      t.date    :birthday

      t.timestamps
    end
  end

  def self.down
    drop_table :children
  end
end