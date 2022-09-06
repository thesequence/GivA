class ChatsController < ApplicationController
  def index
    @chats = Chat.all
  end

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
  end

  def create
    @user_b = User.find(params[:profile_id])
    @chat = Chat.new(name: "#{current_user.name} & #{@user_b.name} Chat")
    @chat.user_a_id = current_user.id
    @chat.user_b_id = @user_b.id
    redirect_to chat_path(@chat) if @chat.save!
  end
end
