class DropChats < ActiveRecord::Migration[7.0]
  def change
    change_table :messages do |t|
      t.remove :chat_id
    end
    drop_table :chats
  end
end
