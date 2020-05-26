class Trip < ApplicationRecord
  belongs_to :user
  has_many :interactions, dependent: :destroy

  validates :destination, inclusion: {in: ["Asia", "Europe", "North-America", "South-America", "Africa", "Oceania"], allow_nil: false}
  validates :start_date, presence: :true
  validates :end_date, presence: true
  validates :budget, numericality: {only_integer: true}
  validates :interests, presence: :true

end
