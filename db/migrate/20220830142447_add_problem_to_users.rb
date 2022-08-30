class AddProblemToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :problem, :text
  end
end
