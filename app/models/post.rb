class Post < ApplicationRecord
  validates :location, presence: true
  

mount_uploader :photo, ImageUploader
has_many :comments, dependent: :destroy, counter_cache: true
belongs_to :user
has_many :likes, dependent: :destroy

geocoded_by :location
after_validation :geocode
end
