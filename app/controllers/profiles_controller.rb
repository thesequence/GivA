class ProfilesController < ApplicationController
  def index
    sleep 3
    @profiles = User.all
  end

  def show
    @profile = User.find(params[:id])
  end
end
