class AddBuddyReferenceToReview < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :buddy, null: false, foreign_key: true
  end
end
