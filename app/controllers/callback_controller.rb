class CallbackController < ApplicationController
  def create
    unless Line::Callback.validate_signature? request
      render status: 400, text: 'Bad Request' and return
    else
      Line::Callback.parse request
      render text: "OK" and return
    end
  end
end
