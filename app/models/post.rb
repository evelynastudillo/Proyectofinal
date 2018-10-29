class Post < ApplicationRecord
mount_uploader :photo, ImageUploader

has_many :users

end
