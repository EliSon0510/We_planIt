class Trip < ApplicationRecord
  belongs_to :user

  belongs_to :interest

  has_many :interactions, dependent: :destroy

  validates :destination, presence: :true
  validates :start_date, presence: :true
  validates :end_date, presence: true
  validates :budget, numericality: {only_integer: true}
  validates :interest, presence: :true

  geocoded_by :destination
  after_validation :geocode, if: :will_save_change_to_destination?

  include PgSearch::Model
  multisearchable against: [:start_date, :end_date, :budget, :destination],
  using: {
      tsearch: { prefix: true }
    }

end
