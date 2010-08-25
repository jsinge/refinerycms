class Product < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description, :long_description]

  validates_presence_of :title
  validates_uniqueness_of :title

  validates_presence_of :description
  validates_presence_of :image

  validates_presence_of :shop

  belongs_to :image
  belongs_to :shop
  has_many :category_products
  has_many :categories, :through => :category_products

  is_taggable :tags, :languages
  IsTaggable::TagList.delimiter = ", "


  # validates_presence_of :ship_info
  # validates_presence_of :legal_info

  has_friendly_id :title, :use_slug => true


  named_scope :randomize, :order => "random() ASC"
  named_scope :limit, lambda { |num| { :limit => num } }
  named_scope :without, lambda { |product| { :conditions => "\"products\".id != #{product.id}" } if product }
  named_scope :similar_to, lambda {|product| {
    :order => "similarity DESC",
    :joins => ["JOIN taggings as t1 ON t1.taggable_id=#{product.id}",
               "JOIN taggings as t2 ON t2.taggable_type=\"Product\" AND products.id = t2.taggable_id"],
    :group => "products.id",
    :select => "products.*, count(products.id) AS similarity",
    :conditions => "t2.tag_id=t1.tag_id "
     }}



end
