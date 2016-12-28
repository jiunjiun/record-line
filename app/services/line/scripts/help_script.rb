module Line::Scripts
  module HelpScript

    def assign
      super

      # --- parse info
      case event
      when Line::Bot::Event::Message
        message_id = event.message['id']
        case event.type
        when Line::Bot::Event::MessageType::Text
          message = event.message['text']

          if message =~ /^(help|HELP|Help)/
            reply_message = 'help'
            response = client.reply_message(event['replyToken'], reply_message)
          end
        end
      end
    end

  end
end
