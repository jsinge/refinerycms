class Product < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description, :long_description]

  validates_presence_of :title
  validates_uniqueness_of :title

  validates_presence_of :description
  validates_presence_of :image

  validates_presence_of :shop

  belongs_to :image
  belongs_to :shop

  is_taggable :tags, :languages

  # validates_presence_of :ship_info
  # validates_presence_of :legal_info

  has_friendly_id :title, :use_slug => true


  named_scope :pick, lambda { |num| { :order => "random() ASC", :limit => num } }
  named_scope :without, lambda { |product| { :conditions => "\"products\".id != #{product.id}" } if product }

  def similar_products(number)
    Product.find(:all, :limit => number, :order => "random() ASC", :conditions => "\"products\".id != #{self.id}")
  end

end
