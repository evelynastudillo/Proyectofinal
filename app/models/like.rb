class Like < ApplicationRecord
validates :user, uniqueness: true
  belongs_to :user
  belongs_to :post
end
