require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  login_user

  describe "index" do
    context "assigns graphs" do
      it do
        SequenceGraphService.stub(:sequences_graph).and_return("sequences_graphs_data")
        CharacterGraphService.stub(:characters_graph).and_return("characters_graphs_data")
        PlaceGraphService.stub(:places_graph).and_return("places_graphs_data")
        RememberedGraphService.stub(:remembered_graph).and_return("remembered_graphs_data")

        get :index

        expect(assigns(:characters_diagram_data)).to eq "characters_graphs_data"
        expect(assigns(:places_diagram_data)).to eq "places_graphs_data"
        expect(assigns(:remembered_diagram_data)).to eq "remembered_graphs_data"
        expect(assigns(:sequences_diagram_data)).to eq "sequences_graphs_data"
      end
    end
  end
end