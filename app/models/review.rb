class Review < ActiveRecord::Base
  belongs_to :restaurant
  validates :rating, inclusion: (1..5)
  belongs_to :user
  validates :user, uniqueness: { scope: :restaurant, message: "has reviewed this restaurant already"}
  has_many :endorsements, dependent: :destroy
end

