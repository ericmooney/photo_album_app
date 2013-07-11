class Album < ActiveRecord::Base
  has_many :photos

  attr_accessible :name

  validates :name, :presence => true
end
