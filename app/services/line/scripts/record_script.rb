module Line::Scripts
  module RecordScript

    def assign
      super

      # sourceable status is RECORD_START record message
      ::Line::Record.call event if sourceable.status == ApplicationRecord::Sourceable::RECORD_START

      # --- parse info
      case event
      when Line::Bot::Event::Message
        message_id = event.message['id']
        case event.type
        when Line::Bot::Event::MessageType::Text
          message = event.message['text']

          reply_messages = parse message
          response = client.reply_message(event['replyToken'], reply_messages)
        end
      end
    end

    private
    def sourceable
      source = event['source']
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

    def sourceable_start_record!
      sourceable.update!(status: ApplicationRecord::Sourceable::RECORD_START)
    end

    def sourceable_end_record!
      sourceable.update!(status: ApplicationRecord::Sourceable::RECORD_END)
    end

    def parse message
      case message
      when /^(start_record|StartRecord)/
        if sourceable.status == ApplicationRecord::Sourceable::RECORD_START
          reply_messages = [
            {
              type: 'text',
              text: "正在紀錄..."
            }
          ]
        else
          sourceable_start_record!

          url_helpers = Rails.application.routes.url_helpers
          record_path = url_helpers.r_url(sourceable.code)

          reply_messages = [
            {
              type: 'text',
              text: "開始紀錄以下的訊息"
            },
            {
              type: 'text',
              text: "您可以此連結即時檢視您的訊息：#{record_path}"
            }
          ]
        end
      when /^(end_record|EndRecord)/
        if sourceable.status == ApplicationRecord::Sourceable::RECORD_END
          reply_messages = [
            {
              type: 'text',
              text: "您尚未開始紀錄!"
            }
          ]
        else
          sourceable_end_record!

          url_helpers = Rails.application.routes.url_helpers
          record_path = url_helpers.r_url(sourceable.code)

          reply_messages = [
            {
              type: 'text',
              text: "已關閉紀錄!"
            },
            {
              type: 'text',
              text: "您可以此連結檢視您的訊息：#{record_path}"
            }
          ]
        end
      end
    end
  end
end
