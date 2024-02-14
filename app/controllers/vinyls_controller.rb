class VinylsController < ApplicationController
  # before_action :set_vinyl, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @query = params[:query]
      @vinyls = Vinyl.where("name LIKE ?", "%#{params[:query]}%")
    else
      @vinyls = Vinyl.all
    end
  end

  def show
    @vinyls = Vinyl.all
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def new
  end

  def mine
  end

  private

  def vinyl_params
    params.require(:vinyl).permit(:title, :genre, :artist, price:)
  end
end
