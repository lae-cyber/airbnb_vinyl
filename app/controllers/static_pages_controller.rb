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

    @text = [
      'Where vinyl enthusiasts lend their musical treasures',
      'A platform for sharing and renting vinyl gems',
      'Where vinyl collectors offer their prized records for rent',
      'A community where you can rent musical treasures on vinyl',
      'The hub for renting vinyl records from passionate collectors',]
  end
end
