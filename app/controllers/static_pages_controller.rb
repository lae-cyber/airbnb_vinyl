class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @vinyls = Vinyl.all
    if params[:query].present?
      @query = params[:query]
      @vinyls = Vinyl.where("title LIKE ?", "%#{params[:query]}%")
    else
      @vinyls = Vinyl.all
    end
  end
end
