class Interaction < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  has_many :messages

  validates :status, inclusion: { in: %w(active pending accepted rejected) }
  validates :trip_id, presence: true
  validates :user_id, presence: true

end
