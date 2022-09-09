class MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @message = Message.new(message_params)
    @message.chat = @chat
    @message.sender_id = current_user.id
    if @message.save
      ChatChannel.broadcast_to(
        @chat,
        message: render_to_string(partial: "message", locals: { message: @message }),
        sender_id: @message.sender_id
      )
      head :ok
    else
      render "chats/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
