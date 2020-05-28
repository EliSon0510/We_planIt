class Interest < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, presence: true
end
