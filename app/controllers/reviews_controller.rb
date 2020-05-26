class ReviewsController < ApplicationController

  before_action :set_review, only: [:edit, :update, :destroy]

  def index
    @reviews = Reviews.all
    @reviews = policy_scope(Review).order(created_at: :desc)
  end

  def new
    @profile = Profile.find(params[:profile_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @profile = Profile.find(params[:profile_id])
    @review.profile_id = @profile.id
    authorize @review
    if @review.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def edit
    authorize @review
  end

  def update
    @review.update(review_params)
    authorize @review
    if @review.save
      redirect_to profile_path(@review.profile)
    else
      render :edit
    end
  end

  def destroy
    authorize @review
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
