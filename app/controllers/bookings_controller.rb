class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:spaceship, :user, :start_date, :end_date, :total_price)
  end
end
