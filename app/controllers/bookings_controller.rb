require 'date'

class BookingsController < ApplicationController
  def new
    @spaceship = Spaceship.find(params[:spaceship_id])
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    # p @booking

    @spaceship = Spaceship.find(params[:spaceship_id])

    @booking.spaceship = @spaceship
    @booking.user = current_user

    @booking.total_price = calculate_total_price(@spaceship.unit_price,
      @booking.start_date, @booking.end_date)


    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:spaceship, :user, :start_date, :end_date, :total_price)
  end

  def calculate_total_price(unit_price, start_date, end_date)
    return unit_price * ((end_date) - (start_date)).to_i
  end
end
