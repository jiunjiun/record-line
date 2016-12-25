require 'line/bot'
module Line
  class Base
    def client
      @client ||= Line::Bot::Client.new { |config|
        config.channel_secret = ENV['LINE_CHANNEL_SECRET']
        config.channel_token  = ENV['LINE_CHANNEL_TOKEN']
      }
    end

    def get_profile user_id
      response = client.get_profile user_id
      case response
      when Net::HTTPSuccess then
        JSON.parse(response.body, symbolize_names: true)
      else
        {}
      end
    end
  end
end
