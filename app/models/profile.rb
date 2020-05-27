class Profile < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :gender, inclusion: {in: ["male", "female", "other"], allow_nil: false}

  has_one_attached :photo
end
