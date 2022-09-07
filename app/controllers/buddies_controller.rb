class BuddiesController < ApplicationController
  def index
    @buddies = Buddy.where(asker_id: current_user.id).or(Buddy.where(receiver_id: current_user.id))
    @users_ids = []
    @buddies.each do |buddy|
      if buddy.asker_id == current_user.id
        bud = buddy.receiver_id
      else
        bud = buddy.asker_id
      end
      @users_ids << bud
    end
    @users = []
    @users_ids.each do |id|
      user = User.find(id)
      @users << user
    end
    @users
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
    if @buddy.save!
      redirect_to buddies_path
    else
      render new, notice: 'Buddy not created'
    end
  end
end
