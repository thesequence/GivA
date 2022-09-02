class Tag < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :language, presence: true, uniqueness: true
  has_many :users
end
