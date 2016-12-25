class Group < ApplicationRecord
  has_one :message, as: :sourceable, dependent: :destroy
end
