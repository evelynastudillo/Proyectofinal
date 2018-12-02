class Like < ApplicationRecord
validates :like, uniqueness: true
  belongs_to :user
  belongs_to :post
end
