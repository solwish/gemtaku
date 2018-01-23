class ShopReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop

  validates :comment, presence: true, length: {minimum: 2, maximum: 255}
end
