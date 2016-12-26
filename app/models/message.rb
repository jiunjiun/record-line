class Message < ApplicationRecord
  belongs_to :sourceable, polymorphic: true
  belongs_to :templatable, polymorphic: true

  module Type
    Text     = 'TemplateText'
    Image    = 'TemplateImage'
    Video    = 'TemplateVideo'
    Audio    = 'TemplateAudio'
    Location = 'TemplateLocation'
    Sticker  = 'TemplateSticker'
  end
end
