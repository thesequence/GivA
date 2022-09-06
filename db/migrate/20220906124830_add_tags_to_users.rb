class AddTagsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :tags, foreign_key: true
  end
end
