class AddImageIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :image_id, :integer
  end

  def self.down
    remove_column :users, :image_id
  end
end
