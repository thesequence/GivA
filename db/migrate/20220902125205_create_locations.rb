class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :category
      t.text :description
      t.time :opening_hour
      t.time :closing_hour

      t.timestamps
    end
  end
end
