class Like < ApplicationRecord
#validates_uniqueness_of :like
  belongs_to :user
  belongs_to :post
end
