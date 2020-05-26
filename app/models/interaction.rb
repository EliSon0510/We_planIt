class Interaction < ApplicationRecord
  belongs_to :trip, :user
  has_many :messages

  validates :validation
end
