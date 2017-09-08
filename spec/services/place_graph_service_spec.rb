require 'rails_helper'

RSpec.describe PlaceGraphService do
  describe ".places_graph" do
    let(:user) { User.new }
    subject { PlaceGraphService.places_graph user }

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

    context 'with one sequence' do
      context'with one place' do
        let!(:dream) { create :dream }
        let!(:user) { dream.user }
        let!(:sequence) { create :sequence, dream: dream }
        let!(:place) { create :place, name: 'Home', sequences: [sequence], user: user }
      
        it do
          result = {
            labels: ["Home"],
            datasets: [
              {
                  label: "Série",
                  backgroundColor: "rgba(220,220,220,0.2)",
                  borderColor: "rgba(220,220,220,1)",
                  data: [1]
              }]
          }
          expect(subject).to eq result
        end
      end

      context 'with two place' do
        let!(:dream) { create :dream }
        let!(:user) { dream.user }
        let!(:sequence) { create :sequence, dream: dream }
        let!(:place) { create :place, name: 'Home', sequences: [sequence], user: user }
        let!(:place_2) { create :place, name: 'Garden', sequences: [sequence], user: user }
        it do
          result = {
            labels: ["Home", "Garden"],
            datasets: [
              {
                  label: "Série",
                  backgroundColor: "rgba(220,220,220,0.2)",
                  borderColor: "rgba(220,220,220,1)",
                  data: [1, 1]
              }]
          }
          expect(subject).to eq result
        end
      end
    end

    context 'with two sequences' do
      context 'with one place' do
        let!(:dream) { create :dream }
        let!(:user) { dream.user }
        let!(:sequence) { create :sequence, dream: dream }
        let!(:sequence_1) { create :sequence, dream: dream }
        let!(:place) { create :place,name: 'Home', sequences: [sequence,sequence_1], user: user }
      
        it do
          result = {
            labels: ["Home"],
            datasets: [
              {
                  label: "Série",
                  backgroundColor: "rgba(220,220,220,0.2)",
                  borderColor: "rgba(220,220,220,1)",
                  data: [2]
              }]
          }
          expect(subject).to eq result
        end
      end

      context 'with two places' do
        let!(:dream) { create :dream }
        let!(:user) { dream.user }
        let!(:sequence) { create :sequence, dream: dream }
        let!(:sequence_1) { create :sequence, dream: dream }
        let!(:place) { create :place,name: 'Home', sequences: [sequence,sequence_1], user: user }
        let!(:place_1) { create :place,name: 'Garden', sequences: [sequence], user: user }
        it do
          result = {
            labels: ["Home", "Garden"],
            datasets: [
              {
                  label: "Série",
                  backgroundColor: "rgba(220,220,220,0.2)",
                  borderColor: "rgba(220,220,220,1)",
                  data: [2, 1]
              }]
          }
          expect(subject).to eq result
        end
      end
    end
  end
end