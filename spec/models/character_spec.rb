require 'rails_helper'

RSpec.describe Character, type: :model do

  describe 'validations' do
    context 'the first name or last name must be defined' do
      context 'when the first name exist' do
        let(:character) { create :character, first_name: 'John', last_name: '' }
        it { expect(character).to be_valid }
      end
      context 'when the last name exist' do
        let(:character) { create :character, first_name: '', last_name: 'Doe' }
        it { expect(character).to be_valid }
      end
      context 'when the last name and first_name does not exist' do
        let(:character) { build :character, first_name: '', last_name: '' }
        it{ expect(character).not_to be_valid }
      end
    end

    context 'First name and last name must be uniq' do
      let!(:character) { create :character, first_name: 'John', last_name: 'Doe' }
      let(:character_2) { build :character, first_name: 'John', last_name: 'Doe' }
      it{ expect(character_2).not_to be_valid }
    end
  end

  describe 'complete_name' do
    let!(:character) { create :character, first_name: 'John', last_name: 'Doe' }
    it { expect(character.complete_name).to eq 'John Doe' }
  end

end
