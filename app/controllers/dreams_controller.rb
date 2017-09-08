class DreamsController < ApplicationController
  before_action :authenticate_user!
  layout 'board' 

  def index
    @dreams = Dream.owned_by current_user
  end

  def new
    @dream = Dream.new
  end

  def show
    @dream = Dream.find(params[:id])
    @moon = Lunartic.on_date((@dream.date+1.days).to_date)
  end

  def create
    @dream = Dream.new(dream_params)
    @dream.user = current_user
    if @dream.save
      if @dream.remembered?
        redirect_to :controller => 'sequences', :action => 'new', :dream_id => @dream.id
      else
        redirect_to :dashboard
      end
    else
      render "new"
    end
  end

  def update
    @dream = Dream.find(params[:id])
    if @dream.update_attributes(dream_params)
      redirect_to :dashboard
    else
      render 'edit'
    end
  end

  def edit
    @dream = Dream.find(params[:id])
  end


  def destroy
    Dream.find(params[:id]).destroy
    redirect_to dreams_url
  end

  def dream_params
    params.require(:dream).permit(:date, :feeling, :remembered)
  end
end
