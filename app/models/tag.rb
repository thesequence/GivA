class Tag < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :user_tags
  has_many :users, through: :user_tags

  # include PgSearch::Model
  # pg_search_scope :search_by_title,
  # against: [ :title ],
  # using: {
  #   tsearch: { prefix: true } # <-- now `superman batm` will return something!
  # }
end
