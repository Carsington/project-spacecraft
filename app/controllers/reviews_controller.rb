class ReviewsController < ApplicationController
  def new
    @spaceship = Spaceship.find(params[:spaceship_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @spaceship = Spaceship.find(params[:spaceship_id])

    @review.spaceship = @spaceship
    @review.user = current_user

    if @review.save
      redirect_to spaceship_path(@spaceship)
    else
      @booking = Booking.new
      render :template => 'spaceships/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:spaceship, :user, :stars, :comment)
  end

end
