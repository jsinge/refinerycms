class CreateProducts < ActiveRecord::Migration

  def self.up
    create_table :products do |t|
      t.string :title
      t.text :description
      t.text :long_description
      t.integer :shop_id
      t.integer :image_id
      t.decimal :price
      t.integer :ship_info_id
      t.integer :legal_info_id
      t.integer :items
      t.integer :availability_id
      t.integer :position

      t.timestamps
    end

    add_index :products, :id

    load(Rails.root.join('db', 'seeds', 'products.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Products"})

    Page.delete_all({:link_url => "/products"})

    drop_table :products
  end

end
