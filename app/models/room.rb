class Room < ApplicationRecord
  has_one :message, as: :sourceable, dependent: :destroy
end
