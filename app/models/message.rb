class Message < ApplicationRecord
  belongs_to :sourceable, polymorphic: true
  belongs_to :templatable, polymorphic: true
end
