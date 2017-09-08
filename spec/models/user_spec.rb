require 'rails_helper'

RSpec.describe User, type: :model do

  describe "association" do
    it do
      user = create :user
      dream = create :dream, user: user
      expect( dream.user ).to eq user
    end
  end
end
