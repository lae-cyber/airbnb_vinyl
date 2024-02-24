class VinylsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_vinyl, only: [:show, :edit, :update, :destroy]

  def index
    @vinyls = Vinyl.all
    if params[:query].present?
      @query = params[:query]
      @vinyls = Vinyl.where("title LIKE ?", "%#{params[:query]}%")
    else
      @vinyls = Vinyl.all
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @vinyl = Vinyl.new
  end

  def create
    @vinyl = Vinyl.new(vinyl_params)
    @vinyl.user = current_user
    if @vinyl.save
      redirect_to '/vinyls/mine.html', notice: 'Vinyl was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @vinyl = Vinyl.find(params[:id])
  end

  def destroy
    @vinyl.destroy
    redirect_to vinyls_path, status: :see_other
  end

  def update
    @vinyl = Vinyl.find(params[:id])
    if @vinyl.update(vinyl_params)
      redirect_to my_vinyls_path, notice: 'Vinyl was successfully updated.'
    else
      render :edit
    end
  end

  def mine
    @vinyls = Vinyl.where(user_id: current_user.id)
  end

  private

  def set_vinyl
    @vinyl = Vinyl.find(params[:id])
  end

  def vinyl_params
    params.require(:vinyl).permit(:title, :description, :artist, :genre, :availability, :price, :photo)
    # params.require(:vinyl).permit(:name, :category)
  end
end
