require 'rails_helper'

RSpec.describe Sequence, type: :model do
  describe 'validations' do
    it 'belongs to a dream' do
      sequence = create :sequence
      dream = create :dream, date: Date.today
      
      dream.sequences << sequence
      expect(sequence.dream).to be dream
    end
  end

  describe 'owned_by' do
    let!(:user_1) { create :user, email: "test@example.com" }
    let!(:user_2) { create :user, email: "test2@example.com" }

    let(:dream) { create :dream, user: user_1 }
    let(:dream_1) { create :dream, user: user_2 }
    let!(:sequence)   { create :sequence, dream: dream }
    let!(:sequence_2) { create :sequence, dream: dream_1 }
    it 'gets the sequences for the right user' do
      expect(Sequence.owned_by user_1).to eq [sequence]
    end
  end
end
