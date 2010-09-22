class CreateShops < ActiveRecord::Migration

  def self.up
    create_table :shops do |t|
      t.string :title
      t.text :description
      t.integer :image_id
      t.integer :user_id
      t.text :legal_info
      t.integer :position

      t.timestamps
    end

    add_index :shops, :id

    load(Rails.root.join('db', 'seeds', 'shops.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Shops"})

    Page.delete_all({:link_url => "/shops"})

    drop_table :shops
  end

end
