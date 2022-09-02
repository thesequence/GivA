class AddLanguageToTags < ActiveRecord::Migration[7.0]
  def change
    add_column :tags, :language, :string
  end
end
