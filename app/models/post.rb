class Post < ApplicationRecord
  
mount_uploader :photo, ImageUploader
has_many :comments, dependent: :destroy
belongs_to :user
has_many :likes, dependent: :destroy

geocoded_by :location
after_validation :geocode
end
