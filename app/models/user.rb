class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :chats
  has_many :messages


  has_many :displaced_buddies, class_name: "Buddy", foreign_key: :asker_id, dependent: :destroy
  has_many :local_buddies, class_name: "Buddy", foreign_key: :receiver_id, dependent: :destroy

  has_one_attached :photo

  # :user_tags, :buddys,:language_tags

  has_many :reviews, dependent: :destroy

  # Find all user's buddies
  def my_buddies
    if displaced
      local_buddies
    else
      displaced_buddies
    end
  end

  # def my_pending_requests
  #   buddies_as_receiver.where(status: :pending)
  # end



end


# Create status field on Buddy
# set status field as enum for buddy, :accepted, :rejected, :pending
# when a buddy is created, automaitcally set it to pending
# create pending request view so a receiver can have a list of pending buddies to accept / reject them
# when finding a user's buddies, filter for only accepted buddies
