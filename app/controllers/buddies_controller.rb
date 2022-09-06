class BuddiesController < ApplicationController
  def index
    @buddies = Buddy.all
  end

  def show
    @buddy = Buddy.find(params[:id])
  end

  def new
    @buddy = Buddy.new
  end

  def create
    @local_person = User.find(params[:profile_id])
    @buddy = Buddy.new
    @buddy.receiver = @local_person
    @buddy.asker = current_user
    @buddy.status = "pending"
  end
end
