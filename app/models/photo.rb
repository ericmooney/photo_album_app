class Photo < ActiveRecord::Base
  belongs_to :album

  mount_uploader :picture, ImageUploader

  attr_accessible :name, :picture, :album_id
end
