class SpaceshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_spaceship, only: [ :show, :edit, :update, :destroy ]

  def index
    if params[:search].present? && params[:search][:query].present?
      @spaceships = Spaceship.search(params[:search][:query])
    else
      @spaceships = Spaceship.all
    end
  end

  def show
    @spaceship = Spaceship.find(params[:id])
    @booking = Booking.new
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
    redirect_to spaceships_path
  end

  private

  def set_spaceship
    @spaceship = Spaceship.find(params[:id])
  end

  def spaceship_params
    params.require(:spaceship).permit(
      :name, :address, :description, :main_pic_url,
      :unit_price, :size, :max_speed, :capacity)
  end
end
