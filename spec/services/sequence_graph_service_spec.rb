require 'rails_helper'

RSpec.describe SequenceGraphService do

  describe ".sequences_graph" do
    let(:user) { User.new }
    subject { SequenceGraphService.sequences_graph user}

    context 'without any data' do
      it 'renders an empty graph' do
        result = {
          labels: [],
          datasets: [
            {
                label: "Série",
                backgroundColor: "rgba(220,220,220,0.2)",
                borderColor: "rgba(220,220,220,1)",
                data: []
            }]
        }
        expect(subject).to eq result
      end
    end

    context 'with data' do
      let!(:user) { create :user }
      let!(:dream) { create :dream, date: Date.new(2017,1,1), user: user}
      let!(:sequence) { create :sequence, dream: dream }
      let!(:sequence_1) { create :sequence, dream: dream }
      let!(:dream_2) { create :dream, date: Date.new(2017,1,2), user: user}
      let!(:sequence_2) { create :sequence, dream: dream_2 }

      result = {
        labels: ["01-01-17", "02-01-17"],
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