require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
  login_user

  describe "new" do
    it "assigns a new place instance" do
      place = Place.new
      Place.stub(:new).and_return(place)
      get :new
      expect(assigns(:place)).to eq(place)
    end
  end

  describe "create" do
    context "when params ok" do
      let(:place_params) { { name: 'Home' } }
      before { post :create, :params => { :place => place_params } }
      it { expect(Place.count).to eq 1 }
    end

    context "when some params are missing" do
      let(:place_params) { { name: nil } }
      before { post :create, :params => { :place => place_params } }
      it { expect(Place.count).to eq 0 }
    end
  end

  describe 'delete' do
    let(:place) { create :place }
    before { post :destroy, :params => { :id => place.id } }
    it { expect(Place.count).to eq 0 }
  end

  describe "update" do
    let!(:place) { create :place, name: 'Home'}
    let(:place_params) { { name: 'Park' } }

    before { post :update, :params => { id: place.id, place: place_params } }

    it { expect(Place.first.name).to eq 'Park' }
  end

end
