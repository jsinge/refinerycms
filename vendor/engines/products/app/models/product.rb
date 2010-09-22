class Product < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description, :long_description]

  validates :title, :presence => true, :uniqueness => true

  validates_presence_of :description
  validates_presence_of :image

  validates_presence_of :shop

  def validate
    errors.add("categories","A category has a different shop") unless categories_shop_consistency
  end

  belongs_to :image
  belongs_to :shop
  has_many :category_products
  has_many :categories, :through => :category_products

  is_taggable :tags, :languages
  IsTaggable::TagList.delimiter = ", "


  # validates_presence_of :ship_info
  # validates_presence_of :legal_info

  has_friendly_id :title, :use_slug => true


  scope :randomize, :order => "random() ASC"
  scope :without, lambda { |product| { :conditions => "\"products\".id != #{product.id}" } if product }
  scope :similar_to, lambda {|product| {
    :order => "count(products.id) DESC",
    :joins => ["JOIN taggings as t1 ON t1.taggable_id=#{product.id}",
               "JOIN taggings as t2 ON t2.taggable_type=\"Product\" AND products.id = t2.taggable_id"],
    :group => "products.id",
    :select => "products.*, count(products.id) AS similarity",
    :conditions => "t2.tag_id=t1.tag_id "
     }}
  

  def categories_shop_consistency
    self.categories.each do |c|
      return false if self.shop_id != c.shop_id
    end
    return true
  end

end
