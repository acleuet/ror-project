class CharactersController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :json
  layout 'board' 

  def index
    @characters = Character.owned_by current_user
  end

  def edit
    @character = Character.find(params[:id])
    respond_modal_with @character
  end

  def new
    @character = Character.new
    respond_modal_with @character
  end

  def create
    @character = Character.new character_params
    @character.user = current_user
    @character.save
    respond_modal_with @character, location: root_path
  end

  def update
    @character = Character.find(params[:id])
    @character.update_attributes(character_params)
    respond_modal_with @character, location: root_path
  end

  def destroy
    Character.find(params[:id]).destroy
    redirect_to characters_url
  end

  private

  def character_params
    params.require(:character).permit(:first_name, :last_name)
  end
end
