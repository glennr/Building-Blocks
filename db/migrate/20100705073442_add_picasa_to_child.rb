class AddPicasaToChild < ActiveRecord::Migration
  def self.up
    add_column :children, :picasa_album, :string
    add_column :children, :picasa_authkey, :string
  end

  def self.down
    remove_column :children, :picasa_authkey
    remove_column :children, :picasa_album
  end
end
