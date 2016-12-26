class RecordController < ApplicationController
  before_action :find_sourceable

  def show
    @title = 'Messages'
    @messages = @sourceable.messages
  end

  def file
    message_id = params[:id]
    result = Line::MessageContent.get message_id
    send_file result[:file].path, filename: result[:filename]
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
