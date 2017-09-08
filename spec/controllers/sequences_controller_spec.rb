require 'rails_helper'

RSpec.describe SequencesController, type: :controller do
  login_user

  let!(:dream) { create :dream }
  describe "new" do
    it "assigns a new sequence instance" do
      sequence = Sequence.new
      Sequence.stub(:new).and_return(sequence)

      get :new,  :params => { :dream_id => dream.id }

      expect(assigns(:sequence)).to eq(sequence)
    end
  end

  describe "create" do
    context "when params ok" do
      let(:sequence_params) { { name: "test", description: 'lorem', character_ids: [], place_ids: [] } }
      before { post :create, :params => { :dream_id => dream.id, :sequence => sequence_params } }
      it { expect(dream.sequences.count).to eq 1 }
    end
  end

  describe "update" do
    let!(:sequence) { create :sequence, description: 'lorem', dream: dream}
    let(:sequence_params) { { description: 'ipsum' } }

    before { post :update, :params => { :dream_id => dream.id, id: sequence.id, sequence: sequence_params } }

    it { expect(Sequence.first.description).to eq 'ipsum' }
  end

  describe 'delete' do
    let(:sequence) { create :sequence, dream: dream }
    before { post :destroy, :params => {  :dream_id => dream.id, :id => sequence.id } }
    it { expect(dream.sequences.count).to eq 0 }
  end

end
