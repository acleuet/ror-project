class PlacesController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :json
  layout 'board' 
  
  def index
    @places = Place.owned_by current_user
  end

  def new
    @place = Place.new
    respond_modal_with @place
  end

  def edit
    @place = Place.find(params[:id])
    respond_modal_with @place
  end

  def create
    @place = Place.new place_params
    @place.user = current_user
    @place.save
    respond_modal_with @place, location: root_path
  end

  def update
    @place = Place.find(params[:id])
    @place.update_attributes(place_params)
    respond_modal_with @place, location: root_path
  end

  def destroy
    Place.find(params[:id]).destroy
    redirect_to places_url
  end

  private

  def place_params
    params.require(:place).permit(:name)
  end
end
