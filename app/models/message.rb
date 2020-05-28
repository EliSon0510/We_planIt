class Message < ApplicationRecord
  belongs_to :interaction
  belongs_to :user
end
