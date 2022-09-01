class AddDefaultDisplacedToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :displaced, :boolean, default: true, null: false
  end
end
