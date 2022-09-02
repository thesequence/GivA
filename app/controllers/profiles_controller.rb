class ProfilesController < ApplicationController
  def index
    @profiles = policy_scope(User)
  end

  def show
    @profile = User.find(params[:id])
    # authorize @profile
  end

  def new
    @profile = User.new
    authorize @profile
  end

  def create
    @profile = User.new user_params
    if @user.save == @user.displaced
      sign_in @user
      # flash[:success] = t('.success', name: current_user.name_or_email)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:boolean)
  end
end
