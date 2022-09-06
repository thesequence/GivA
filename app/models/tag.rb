class Tag < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :user_tags
  has_many :users, through: :user_tags
end
