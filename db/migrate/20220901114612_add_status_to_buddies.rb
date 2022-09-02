class AddStatusToBuddies < ActiveRecord::Migration[7.0]
  def change
    add_column :buddies, :status, :integer
  end
end
