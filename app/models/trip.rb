class Trip < ApplicationRecord
  belongs_to :user

  has_many :interactions, dependent: :destroy

  has_and_belongs_to_many :interests

  validates :destination, presence: :true
  validates :start_date, presence: :true
  validates :end_date, presence: true
  validates :budget, numericality: {only_integer: true}
  validates :interests, presence: :true

  geocoded_by :destination
  after_validation :geocode, if: :will_save_change_to_destination?

  include PgSearch::Model
  multisearchable against: [:start_date, :end_date, :budget, :destination],
  using: {
      tsearch: { prefix: true }
    }

end
