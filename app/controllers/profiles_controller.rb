class ProfilesController < ApplicationController

  before_action :set_profile, only:[:show, :edit, :destroy, :update]

  def show
    @review = Review.new
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to root.path
  end

private

  def set_profile
    @profile = Profile.find(params[:id])
  end

   def profile_params
    params.require(:profile).permit(:first_name, :last_name, :age, :location, :gender, :photo)
  end



end
