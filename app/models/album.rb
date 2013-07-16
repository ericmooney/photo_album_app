class Album < ActiveRecord::Base
  has_many :photos, :dependent => :destroy
  belongs_to :user
  has_many :comments, as: :commentable

  attr_accessible :name, :user_id

  validates :name, :presence => true
  validates :user_id, :presence => true
end
