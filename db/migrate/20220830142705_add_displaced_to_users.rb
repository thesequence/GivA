class AddDisplacedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :displaced, :boolean
  end
end
