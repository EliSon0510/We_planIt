class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :trips
  has_many :interactions

  # this is a test!

  has_one :profile, dependent: :destroy

  # this was added because of db:seed error..

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
