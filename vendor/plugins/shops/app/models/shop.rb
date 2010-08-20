class Shop < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description, :legal_info]

  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :user

  belongs_to :image
  belongs_to :user


end
