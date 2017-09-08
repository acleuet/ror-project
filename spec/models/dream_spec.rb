require 'rails_helper'

RSpec.describe Dream, type: :model do

  describe 'validations' do
    context 'feeling value' do
      context 'with incorrect value' do
        let(:dream) { build :dream, feeling: 'test' }
        it 'is not valid' do
          expect(dream).not_to be_valid
        end
      end
      context 'with correct value' do
        let(:dream) { build :dream, feeling: 'meh' }
        it 'is valid' do
          expect(dream).to be_valid
        end
      end
    end

    it 'has many sequences and characters' do
      dream = create :dream
      sequence  = create :sequence, dream: dream
      
      expect(dream.sequences).to eq [ sequence ]
    end

    context 'user' do
      it 'a user can not register multiple dreams for the same date' do
        user = create :user, email: "test@example.com"
        dream = create :dream, user: user, date: Date.new(2001,2,3)
        dream_2 = build :dream, user: user, date: Date.new(2001,2,3)

        expect(dream_2).not_to be_valid
      end

      it 'two users can register a dream for the same date' do
        user = create :user, email: "test@example.com"
        dream = create :dream, user: user, date: Date.new(2001,2,3)
        user_2 = create :user, email: "test2@example.com"
        dream_2 = build :dream, user: user_2, date: Date.new(2001,2,3)
        expect(dream_2).to be_valid
      end
    end
  end

  describe 'characters_count' do
    it 'calculates the number of characters' do
      dream = create :dream
      sequence = create :sequence, dream: dream
      character_1 = create :character, sequences: [sequence], first_name: 'John'
      character_2 = create :character, sequences: [sequence], first_name: 'Antoine'

      expect(dream.characters_count).to eq 2
      expect(dream.characters).to match_array [character_1, character_2]
    end
  end

  describe 'places_count' do
    it 'calculates the number of places' do
      dream = create :dream
      sequence = create :sequence, dream: dream
      place_1 = create :place, sequences: [sequence], name:'Home'
      place_2 = create :place, sequences: [sequence], name:'Basement'

      expect(dream.places_count).to eq 2
      expect(dream.places).to match_array [place_1, place_2]
    end
  end

  describe 'sequences_count' do
    it 'calculates the number of sequences' do
      dream = create :dream
      sequence_1 = create :sequence, dream: dream
      sequence_2 = create :sequence, dream: dream

      expect(dream.sequences_count).to eq 2
      expect(dream.sequences).to match_array [sequence_1, sequence_2]
    end
  end


  describe "short_description" do
    it 'returns the main dream infos' do
      dream = create :dream
      sequence = create :sequence, dream: dream
      character_1 = create :character, sequences: [sequence]
      place_1 = create :place, sequences: [sequence], name:'Home'
      place_2 = create :place, sequences: [sequence], name:'Basement'

      result = { id: dream.id, 
                 date: dream.date,
                 sequences_count: 1,
                 characters_count: 1,
                 places_count: 2,
                 feeling: 'happy'
                }

      expect(dream.short_description).to eq result
    end
  end

  describe 'owned_by' do
    let!(:user_1) { create :user, email: "test@example.com" }
    let!(:user_2) { create :user, email: "test2@example.com" }

    let!(:dream)   { create :dream, user: user_1 }
    let!(:dream_2) { create :dream, user: user_2, date: Date.new(2001,2,3) }
    it 'gets the dreams for the right user' do
      expect(Dream.owned_by user_1).to eq [dream]
    end
  end
end
