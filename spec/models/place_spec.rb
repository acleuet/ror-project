require 'rails_helper'

RSpec.describe Place, type: :model do
  describe 'validations' do
    context 'name must be uniq' do
      let!(:place) { create :place, name: 'Home' }
      let(:place_2) { build :place, name: 'home' }

      it { expect(place_2).to be_valid }
    end

    context 'two users can register a place with the same name' do
      let!(:user) { create :user }
      let!(:user_2) { create :user }

      let!(:place) { create :place, name: 'Home', user: user }
      let(:place_2) { build :place, name: 'Home', user: user_2 }

      it { expect(place_2).to be_valid }
    end

    context 'name length greater than 2' do
      let(:place) { build :place, name: 'A' }

      it { expect(place).not_to be_valid }
    end

    context 'with correct params' do
      let!(:place) { create :place, name: 'Home' }
      it { expect(Place.count).to eq 1 }
    end
  end

  describe 'owned_by' do
    let!(:user_1) { create :user, email: "test@example.com" }
    let!(:user_2) { create :user, email: "test2@example.com" }

    let!(:place)   { create :place, user: user_1 }
    let!(:place_2) { create :place, user: user_2 }
    it 'gets the place for the right user' do
      expect(Place.owned_by user_1).to eq [place]
    end
  end
end