class Photo < ActiveRecord::Base
  belongs_to :album
  has_many :comments, as: :commentable

  mount_uploader :picture, ImageUploader

  attr_accessible :name, :picture, :album_id

  validates :album_id, :presence => true
  validates :picture, :presence => true

end
