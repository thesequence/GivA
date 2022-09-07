class ProfilesController < ApplicationController
  def index
    sleep 3
    @profiles = User.all
    if current_user.displaced
      @profiles = User.where(displaced: false)
    elsif current_user.displaced == false
      @profiles = User.where(displaced: true)
    else
      @profiles = User.all
    end
  end

  def show
    @profile = User.find(params[:id])
  end
end
