class Shop < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description, :legal_info]

  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :user

  belongs_to :image
  belongs_to :user

  has_many :products 
  has_many :categories
  
  has_friendly_id :title, :use_slug => true

  def tags
    Tag.find(:all,
             :select => "tags.name, count (taggings.taggable_id) AS frequency", 
             :joins => ["INNER JOIN taggings ON tags.id=taggings.tag_id",
                     "INNER JOIN products ON taggings.taggable_id=products.id AND taggings.taggable_type='Product'"], 
             :conditions => "products.shop_id=#{self.id}",
             :group => "tags.id",
             :order => "frequency DESC")
  end

  # lists categories ordered using depth-first traversal
  def list_categories
    traverse(self.categories.top)
  end
  
  # list all subcategories recursively
  def traverse(categories)
    categories.map{|cat| [cat] + traverse(cat.children)}.flatten
  end

end
