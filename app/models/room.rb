class Room < ApplicationRecord
  has_many :messages, as: :sourceable, dependent: :destroy
end
