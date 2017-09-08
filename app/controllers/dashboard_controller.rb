class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @dreams = Dream.owned_by(current_user)
                   .order("id DESC")
                   .includes(:sequences).map do |dream| 
                      dream.short_description
                    end

    self.characters_diagram
    self.places_diagram
    self.remembered_diagram
    self.sequences_diagram
    
    render layout: 'board' 
  end

  def sequences_diagram
    @sequences_diagram_data = SequenceGraphService.sequences_graph current_user
    @sequences_diagram_options = {}
  end

  def characters_diagram
    @characters_diagram_data = CharacterGraphService.characters_graph current_user
    @characters_diagram_options = {}
  end

  def places_diagram
    @places_diagram_data = PlaceGraphService.places_graph current_user
    @places_diagram_options = {}
  end

  def remembered_diagram
    @remembered_diagram_data = RememberedGraphService.remembered_graph current_user
    @remembered_diagram_options = {}
  end
end
