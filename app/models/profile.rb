class Profile < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :gender, inclusion: {in: ["male", "female", "other"], allow_nil: false}

  has_one_attached :photo
end
