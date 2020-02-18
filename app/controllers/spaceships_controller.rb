class SpaceshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @spaceships = Spaceship.all
  end

  def show
    @spaceship = Spaceship.find(params[:id])
  end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    if @spaceship.save
      redirect_to @spaceship
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(
      :name, :address, :description, :main_pic_url,
      :unit_price, :size, :max_speed, :capacity)
  end
end
