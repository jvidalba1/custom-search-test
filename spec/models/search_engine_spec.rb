require 'rails_helper'

RSpec.describe SearchEngine, type: :model do
  describe 'validations' do
    context 'invalid parameters' do
      it 'should be invalid without text' do
        expect(described_class.new('google', '').valid?).to eq false
      end

      it 'should be invalid without engine' do
        expect(described_class.new('', 'text').valid?).to eq false
      end

      it 'should be invalid with a wrong engine' do
        expect(described_class.new('whatever', '').valid?).to eq false
      end
    end

    context 'valid parameters' do
      it 'should be valid with valid values' do
        expect(described_class.new('google', 'text').valid?).to eq true
      end
    end
  end

  describe "#results" do
    context 'Google search' do
      it 'returns all the items from the query' do
        file = File.read "#{Rails.root}/spec/support/google_results.json"
        data = JSON.parse(file)
        allow(HTTParty).to receive(:get).and_return(data)
        search_engine = described_class.new('google', 'medellin')
        items = search_engine.results
        expect(items.count).to eq 10
        expect(items.all? {|a| a.class == Item }).to eq true
      end
    end
  end

end
