class Post < ApplicationRecord
mount_uploader :photo, ImageUploader
has_many :comments
belongs_to :user
has_many :likes


geocoded_by :location
after_validation :geocode
end
