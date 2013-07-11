class Album < ActiveRecord::Base
  has_many :photos
  belongs_to :user

  attr_accessible :name, :user_id

  validates :name, :presence => true
  validates :user_id, :presence => true
end
