class Trip < ApplicationRecord
  belongs_to :user

  belongs_to :interest

  has_many :interactions

  validates :destination, inclusion: {in: ["Asia", "Europe", "North-America", "South-America", "Africa", "Oceania"], allow_nil: false}
  validates :start_date, presence: :true
  validates :end_date, presence: true
  validates :budget, numericality: {only_integer: true}
  validates :interests, presence: :true

end
