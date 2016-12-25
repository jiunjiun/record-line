class TemplateSticker < ApplicationRecord
  has_one :message, as: :templatable, dependent: :destroy
end
