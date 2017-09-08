class SequencesController < ApplicationController
  before_action :authenticate_user!
 layout 'board' 
  def new
    @dream =  Dream.find(params[:dream_id])
    @sequence = Sequence.new
  end

  def edit
    @dream =  Dream.find(params[:dream_id])
    @sequence = Sequence.find(params[:id])
  end

  def update
    @sequence = Sequence.find(params[:id])
    if @sequence.update_attributes(sequence_params)
      redirect_to :dashboard
    else
      render 'edit'
    end
  end

  def destroy
    Sequence.find(params[:id]).destroy
  end

  def create
    @sequence = Sequence.new(sequence_params)
    @sequence.dream_id = params[:dream_id]
    
    if @sequence.save
      if params.has_key?(:submit_and_new)
        redirect_to :controller => 'sequences', :action => 'new', :dream_id => @sequence.dream_id
      else
        redirect_to :dashboard
      end
    end
  end

  def sequence_params
    params.require(:sequence).permit(:name, :description, :character_ids=>[], :place_ids=>[])
  end
end
