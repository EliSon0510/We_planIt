class Interest < ApplicationRecord
  has_many :trips
  validates :name, presence: true

  include PgSearch::Model
  multisearchable against: [:name]

end
