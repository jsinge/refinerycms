class Product < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description, :long_description]

  validates_presence_of :title
  validates_uniqueness_of :title

  validates_presence_of :description
  validates_presence_of :image

  validates_presence_of :shop

  belongs_to :image
  belongs_to :shop

  # validates_presence_of :ship_info
  # validates_presence_of :legal_info

  has_friendly_id :title, :use_slug => true
end
