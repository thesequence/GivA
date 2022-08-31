class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :chats
  has_many :messages
  has_one_attached :photo
  # :user_tags, :buddys,:language_tags


  has_many :reviews, dependent: :destroy
end
