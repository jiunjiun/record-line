module Line
  class MessageContent < Base
    def self.get message_id
      new.get message_id
    end

    def get message_id
      result = get_message_content message_id
      {file: result[:file], filename: filename(result[:content_type])}
    end

    private
    def filename content_type
      filename = Time.now.to_i
      case content_type
      # image
      when 'image/jpg', 'image/jpeg'
        "#{filename}.jpg"
      when 'image/png'
        "#{filename}.png"
      when 'image/gif'
        "#{filename}.gif"

      # Audio
      when 'audio/x-m4a'
        "#{filename}.m4a"

      # Video
      when 'video/mp4'
        "#{filename}.mp4"
      end
    end
  end
end
