class Profile < ApplicationRecord
  has_many :reviews, dependent: :detroy

  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :gender, presence: :true

  has_one_attached :photo
end
