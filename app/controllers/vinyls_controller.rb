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
  end

  def new
    @vinyl = Vinyl.new
  end

  def create
    @vinyl = Vinyl.new(vinyl_params)
    @vinyl.user = current_user
    if @vinyl.save
      redirect_to vinyls_path
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
      redirect_to @vinyl, notice: 'Vinyl was successfully updated.'
    else
      render :edit
    end
  end

  def mine
    @vinyls = Vinyl.all
  end

  private

  def set_vinyl
    @vinyl = Vinyl.find(params[:id])
  end

  def vinyl_params
    params.require(:vinyl).permit(:title, :description, :artist, :genre, :availability, :price, :photo)
  end
end
