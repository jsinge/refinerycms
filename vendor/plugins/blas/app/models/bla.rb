class Bla < ActiveRecord::Base

  acts_as_indexed :fields => [:test]

  validates_presence_of :test
  validates_uniqueness_of :test



end
