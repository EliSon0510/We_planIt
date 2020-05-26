class ReviewsController < ApplicationController

  before_action :set_review, only: [:edit, :update, :destroy]

  def index
    @reviews = Reviews.all
  end

  def new
    @profile = Profile.find(params[:profile_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @profile = Profile.find(params[:profile_id])
    @review.profile_id = @profile.id
    if @review.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:profile_id])
  end

  def update
    @profile = Profile.find(params[:profile_id])
    @review.update(review_params)
    if @review.save
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to profile_path(@profile)
  end

private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
