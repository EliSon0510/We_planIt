class Review < ApplicationRecord
  belongs_to :profile
  belongs_to :user

  validates :rating, presence: :true
end
