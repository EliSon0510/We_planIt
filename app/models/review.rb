class Review < ApplicationRecord
  belongs_to :profile

  validates :rating, presence: :true
end
