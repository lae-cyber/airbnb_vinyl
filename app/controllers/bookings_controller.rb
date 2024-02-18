class BookingsController < ApplicationController
  def create
  end

  def new
    @booking = Booking.new
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :vinyl_id, :start_date, :end_date)
  end
end
