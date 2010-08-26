class Category < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description]
  acts_as_tree

  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :shop

  def validate
    errors.add("parent", "category doesn't belong to same shop") unless parent_shop_consistency
    errors.add("children","categories don'T belong to same shop") unless children_shop_consistency
    errors.add("products", "don't belong to same shop") unless products_shop_consistency
  end



  belongs_to :image
  belongs_to :shop
  has_many :category_products
  has_many :products, :through => :category_products

  has_friendly_id :title, :use_slug => true

  named_scope :top, :conditions => "'categories'.parent_id IS NULL"

  def indented_title
    "#{"--" * self.ancestors.size} #{self.title}".chomp
  end

  def parent_shop_consistency
    self.parent.nil? || (self.shop_id == parent.shop_id) 
  end
     
  def children_shop_consistency
    if children.any?
      children.each do |child|
        return false if child.shop_id != self.shop_id
      end
    end
    return true
  end

  def products_shop_consistency
    if products.any?
      products.each do |product|
        return false if product.shop_id != self.shop_id
      end
    end
    return true
  end

end
