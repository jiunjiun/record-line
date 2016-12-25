module Line
  class Record < Base
    attr_reader :event, :templatable, :sourceable

    def self.call event
      new(event).call
    end

    def initialize event
      @event = event
    end

    def call
      case event
      when Line::Bot::Event::Message
        message_id = event.message['id']
        case event.type
        when Line::Bot::Event::MessageType::Text
          text = event.message['text']
          templatable = TemplateText.create! message_id: message_id, text: text

        when Line::Bot::Event::MessageType::Image
          templatable = TemplateImage.create! message_id: message_id

        when Line::Bot::Event::MessageType::Video
          templatable = TemplateVideo.create! message_id: message_id

        when Line::Bot::Event::MessageType::Audio
          templatable = TemplateAudio.create! message_id: message_id

        when Line::Bot::Event::MessageType::Location
          title     = event.message['title']
          address   = event.message['address']
          latitude  = event.message['latitude']
          longitude = event.message['longitude']

          templatable = TemplateLocation.create!({message_id: message_id, title: title, address: address, latitude: latitude, longitude: longitude})

        when Line::Bot::Event::MessageType::Sticker
          package_id = event.message['packageId']
          sticker_id = event.message['stickerId']

          templatable = TemplateSticker.create!({message_id: message_id, package_id: package_id, sticker_id: sticker_id})

        when Line::Bot::Event::MessageType::Unsupport
        end

        sourceable = parse_sourceable event['source']

        # Create Message
        create_message
      end
    end

    private
    def create_message
      Message.create! templatable: templatable, sourceable: sourceable
    end

    def parse_sourceable source
      case source['type']
      when 'user'
        user_id = source['userId']
        profile = get_profile user_id
        User.find_or_create_by(user_id: user_id) do |user|
          user.name           = profile[:name]
          user.avatar         = profile[:pictureUrl]
          user.status_message = profile[:statusMessage]
        end
      when 'group'
        group_id = source['groupId']
        Group.find_or_create_by(group_id: group_id)
      when 'room'
        room_id = source['roomId']
        Room.find_or_create_by(room_id: room_id)
      end
    end
  end
end
