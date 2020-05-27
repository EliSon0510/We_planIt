class ReviewsController < ApplicationController

  before_action :set_review, only: [:edit, :update, :destroy]

  def index
    @reviews = Reviews.all
    @reviews = policy_scope(Review).order(created_at: :desc)
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
  end

  def update
    @review.update(review_params)
    if @review.save
      redirect_to profile_path(@review.profile)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to profile_path(@review.profile)
  end

private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
