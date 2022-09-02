class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
  end
  if @message.save
    redirect_to messages_path(@messages)
  else
    render :new, status: :unprocessable_entity
  end
end

  private

  def message_params
    params.require(:message).permit(:content, :asker_id)
  end
end
