class RecordController < ApplicationController
  before_action :find_sourceable

  def show
    @title = 'title'
    @messages = @sourceable.messages
  end

  def image
    message_id = params[:id]
    file = Line::MessageContent.get message_id
    send_file file.path, disposition: 'inline'
  end

  private
  def find_sourceable
    record_id = params[:id]

    case record_id.first
    when 'G'
      @sourceable = Group.find_by_code record_id
    when 'R'
      @sourceable = Room.find_by_code record_id
    when 'U'
      @sourceable = User.find_by_code record_id
    end
  end
end
