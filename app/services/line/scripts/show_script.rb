module Line::Scripts
  module ShowScript

    def assign
      super

      # --- parse info
      case event
      when Line::Bot::Event::Message
        message_id = event.message['id']
        case event.type
        when Line::Bot::Event::MessageType::Text
          message = event.message['text']

          if message =~ /^(show)/
            url_helpers = Rails.application.routes.url_helpers
            sourceable = parse_sourceable event['source']
            record_path = url_helpers.r_url(sourceable.code)

            reply_messages = [
              {
                type: 'text',
                text: "連結：#{record_path}"
              }
            ]
            response = client.reply_message(event['replyToken'], reply_messages)
          end
        end
      end
    end

    private
    def parse_sourceable source
      case source['type']
      when 'user'
        user_id = source['userId']
        profile = get_profile user_id
        User.find_or_create_by(user_id: user_id) do |user|
          user.name           = profile[:displayName]
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
