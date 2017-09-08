require 'rails_helper'

RSpec.describe CharacterGraphService do

  describe ".characters_graph" do
    let(:user) { User.new }
    subject { CharacterGraphService.characters_graph user}

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
      context'with one character' do
        let!(:dream) { create :dream }
        let!(:user) { dream.user }
        let!(:sequence) { create :sequence, dream: dream }
        let!(:character) { create :character,first_name: 'John', last_name: 'Doe', sequences: [sequence], user: user }
      
        it do
          result = {
            labels: ["John Doe"],
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

      context 'with two character' do
        let!(:dream) { create :dream }
        let!(:user) { dream.user }
        let!(:sequence) { create :sequence, dream: dream }
        let!(:character) { create :character,first_name: 'John', last_name: 'Doe', sequences: [sequence], user: user }
        let!(:character_2) { create :character,first_name: 'Antoine', last_name: 'Doe', sequences: [sequence], user: user }
        it do
          result = {
            labels: ["John Doe", "Antoine Doe"],
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
      context 'with one character' do
        let!(:dream) { create :dream }
        let!(:user) { dream.user }
        let!(:sequence) { create :sequence, dream: dream }
        let!(:sequence_1) { create :sequence, dream: dream }
        let!(:character) { create :character,first_name: 'John', last_name: 'Doe', sequences: [sequence,sequence_1], user: user }
      
        it do
          result = {
            labels: ["John Doe"],
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

      context 'with two characters' do
        let!(:dream) { create :dream }
        let!(:user) { dream.user }
        let!(:sequence) { create :sequence, dream: dream }
        let!(:sequence_1) { create :sequence, dream: dream }
        let!(:character) { create :character,first_name: 'John', last_name: 'Doe', sequences: [sequence,sequence_1], user: user }
        let!(:character_1) { create :character,first_name: 'Antoine', last_name: 'Doe', sequences: [sequence], user: user }
        it do
          result = {
            labels: ["John Doe", "Antoine Doe"],
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