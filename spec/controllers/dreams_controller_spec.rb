require 'rails_helper'

RSpec.describe DreamsController, type: :controller do
  login_user

  describe "new" do
    it "assigns a new dream instance" do
      dream = Dream.new
      Dream.stub(:new).and_return(dream)
      get :new
      expect(assigns(:dream)).to eq(dream)
    end
  end

  describe "create" do
    context "when params ok" do
      let(:dream_params) { { date: Date.today, feeling: 'happy', remembered: true } }
      before { post :create, :params => { :dream => dream_params } }
      it { expect(Dream.count).to eq 1 }
      it { expect(response).to redirect_to("/dreams/#{Dream.last.id}/sequences/new")}
    end

    context "when don't remember dream" do
      let(:dream_params) { { date: Date.today, feeling: 'happy', remembered: false } }
      before { post :create, :params => { :dream => dream_params } }
      it { expect(response).to redirect_to("/dashboard")}
    end

    context "when some params are missing" do
      let(:dream_params) { { date: Date.today } }
      before { post :create, :params => { :dream => dream_params } }
      it { expect(Dream.count).to eq 0 }
      it { expect(response).to render_template(:new) }
    end
  end

  describe 'delete' do
    let(:dream) { create :dream }
    before { post :destroy, :params => { :id => dream.id } }
    it { expect(Dream.count).to eq 0 }
  end


  describe "update" do
    let!(:dream) { create :dream, feeling: 'meh'}
    let(:dream_params) { { date: Date.today, feeling: 'happy', remembered: true  } }

    before { post :update, :params => { id: dream.id, dream: dream_params } }

    it { expect(Dream.first.feeling).to eq 'happy' }
  end

end
