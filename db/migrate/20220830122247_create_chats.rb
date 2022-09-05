class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.string :name
      t.references :user_a, add_foreign_key: { to_table: :users }
      t.references :user_b, add_foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
