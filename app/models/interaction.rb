class Interaction < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  has_many :messages

  validates :validation, default: false
  validates :trip_id, presence: true
  validates :user_id, presence: true

end
