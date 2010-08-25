class Category < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description]
  acts_as_tree

  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :shop

  belongs_to :image
  belongs_to :shop


end
