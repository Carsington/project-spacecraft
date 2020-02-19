class SpaceshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_spaceship, only: [ :show, :edit, :update, :destroy ]

  def index
    @spaceships = Spaceship.all
  end

  def show
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
