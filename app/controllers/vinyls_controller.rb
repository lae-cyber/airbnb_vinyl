class VinylsController < ApplicationController
  before_action :set_vinyl, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @query = params[:query]
      @vinyls = Vinyl.where("name LIKE ?", "%#{params[:query]}%")
    else
      @vinyls = Vinyl.all
    end
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

  def show
    @vinyls = Vinyl.all
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def mine
  end

  private

  def set_vinyl
    @vinyl = Vinyl.find(params[:id])
  end

  def vinyl_params
    params.require(:vinyl).permit(:title, :description, :artist, :genre, :availability, :price, :photo)
  end
end
