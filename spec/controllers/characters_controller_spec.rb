require 'rails_helper'

RSpec.describe CharactersController, type: :controller do
  login_user
  describe "new" do
    it "assigns a new character instance" do
      character = Character.new
      Character.stub(:new).and_return(character)
      get :new
      expect(assigns(:character)).to eq(character)
    end
  end

  describe "create" do
    context "when params ok" do
      let(:character_params) { { first_name: 'John', last_name: 'Doe' } }
      before { post :create, :params => { :character => character_params } }
      it { expect(Character.count).to eq 1 }
    end

    context "when some params are missing" do
      let(:character_params) { { first_name: nil, last_name: nil } }
      before { post :create, :params => { :character => character_params } }
      it { expect(Character.count).to eq 0 }
    end
  end

  describe 'delete' do
    let(:character) { create :character }
    before { post :destroy, :params => { :id => character.id } }
    it { expect(Character.count).to eq 0 }
  end


  describe "update" do
    let!(:character) { create :character, first_name: 'bob'}
    let(:character_params) { { first_name: 'Antoine' } }

    before { post :update, :params => { id: character.id, character: character_params } }

    it { expect(Character.first.first_name).to eq 'Antoine' }
  end
end
