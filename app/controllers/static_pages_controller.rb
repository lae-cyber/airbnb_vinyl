class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @booking = Booking.new
    @vinyls = Vinyl.all
    if params[:query].present?
      @query = params[:query]
      @vinyls = Vinyl.where("title LIKE ?", "%#{params[:query]}%")
    else
      @vinyls = Vinyl.all
    end
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :vinyl_id, :start_date, :end_date)
  end
end
