require 'rails_helper'

RSpec.describe RememberedGraphService do
  describe ".remembered_graph" do
    let(:user) { User.new }
    subject { RememberedGraphService.remembered_graph user}

    context 'without any data' do
      it 'renders an empty graph' do
        result = {
          labels: ["Mémorisé", "Oublié"],
          datasets: [
            {
                label: "Série",
                backgroundColor: "rgba(220,220,220,0.2)",
                borderColor: "rgba(220,220,220,1)",
                data: [0, 0]
            }]
        }
        expect(subject).to eq result
      end
    end

    context 'with data' do
      let!(:user) { create :user }
      let!(:dream) { create :dream, date: Date.today, remembered: false, user: user}
      let!(:dream_1) { create :dream, date: Date.today-1.days, remembered: true, user: user}
      let!(:dream_2) { create :dream, date: Date.today-2.days, remembered: true, user: user}

      result = {
        labels: ["Mémorisé", "Oublié"],
        datasets: [
          {
              label: "Série",
              backgroundColor: "rgba(220,220,220,0.2)",
              borderColor: "rgba(220,220,220,1)",
              data: [2, 1]
          }]
      }
      it{ expect(subject).to eq result }
    end

  end
end