class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :chats
  has_many :messages
  has_many :buddies_as_asker, class_name: "Buddy", foreign_key: :asker_id
  has_many :buddies_as_receiver, class_name: "Buddy", foreign_key: :receiver_id
  # :user_tags, :buddys,:language_tags


  has_many :reviews, dependent: :destroy
end
