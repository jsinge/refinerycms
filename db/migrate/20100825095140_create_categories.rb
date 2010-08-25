class CreateCategories < ActiveRecord::Migration

  def self.up
    create_table :categories do |t|
      t.string :title
      t.text :description
      t.integer :parent_id
      t.integer :shop_id
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

    add_index :categories, :id

    load(Rails.root.join('db', 'seeds', 'categories.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Categories"})

    Page.find_all_by_link_url("/categories").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/categories"})

    drop_table :categories
  end

end
