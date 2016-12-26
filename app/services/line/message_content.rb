module Line
  class MessageContent < Base
    def self.get message_id
      new.get_message_content message_id
    end
  end
end


