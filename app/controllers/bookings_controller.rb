class BookingsController < ApplicationController
  before_action :set_vinyl, only: [:new, :create]
  before_action :set_booking, only: [:show, :destroy]
  def new
    @vinyl = Vinyl.find(params[:vinyl_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.vinyl = @vinyl

    if @booking.save
      redirect_to vinyl_path(@vinyl), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end


  def show
    @vinyl = Vinyl.find(params[:id])
  end

  def destroy
    @booking.destroy
    redirect_to vinyl_path(@booking.vinyl), notice: 'Booking was successfully destroyed.'
  end


  private

  def set_vinyl
    @vinyl = Vinyl.find(params[:vinyl_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Vinyl not found"
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:rental_from, :rental_to, :additional_details)
  end

end
