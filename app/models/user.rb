class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :profile, dependent: :destroy
  has_many :trips, dependent: :destroy
  has_many :interactions, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
