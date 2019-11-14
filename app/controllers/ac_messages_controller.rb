class AcMessagesController < ApplicationController
  def new
    @message = AcMessage.new
  end

  def create
    @message = AcMessage.create(msg_params)
    if @message.save
      ActionCable.server.broadcast "room_channel", content: @message.content
    else
    end
  end

  private

  def msg_params
    params.require(:ac_message).permit(:content)
  end
end
