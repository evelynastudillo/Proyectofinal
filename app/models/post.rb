class Post < ApplicationRecord
mount_uploader :photo, ImageUploader
has_many :comments
belongs_to :user
has_many :likes

end
