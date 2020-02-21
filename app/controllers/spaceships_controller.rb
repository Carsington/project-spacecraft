class SpaceshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_spaceship, only: [ :show, :edit, :update, :destroy ]

  SPACESHIP_IMAGES = [
    "07_ljxygu", "04_rtymsz", "01_x67kdi", "06_q2rsfn", "05_p1r7ub", "08_fpsmhu", "03_dvrozk", "02_dwhcf8"]

  def index
    if params[:search].present? && params[:search][:query].present?
      @query = params[:search][:query]
      @spaceships = Spaceship.search(@query)
    else
      @spaceships = Spaceship.all
    end

    if @spaceships.empty?
      @no_results = true
      @spaceships = Spaceship.all
    end
  end

  def show
    @spaceship = Spaceship.find(params[:id])
    if @spaceship.reviews.count <= 0
      @no_reviews = true
    else
      sum_stars = 0
      @spaceship.reviews.each do |review|
        sum_stars += review.stars
      end
      @full_stars = sum_stars / @spaceship.reviews.count
      @empy_stars = 5 - @full_stars
    end


    @booking = Booking.new
    @review = Review.new
  end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = current_user

    @spaceship.main_pic_url = 'generic_spaceships/02.jpg'

    if @spaceship.save
      redirect_to @spaceship
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @spaceship.update(spaceship_params)
      redirect_to spaceship_path(@spaceship)
    else
      render :edit
    end
  end

  def destroy
    @spaceship.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_spaceship
    @spaceship = Spaceship.find(params[:id])
  end

  def spaceship_params
    params.require(:spaceship).permit(
      :name, :address, :description, :photo,
      :unit_price, :size, :max_speed, :capacity)
  end
end
