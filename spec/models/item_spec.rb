require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "#to_json" do
    it 'converts a item into a hash' do
      item = described_class.new('Title', 'www', 'desc', 'google')
      expect(item.to_json).to eq({
        title: item.title,
        link: item.link,
        description: item.description,
        engine: item.engine
      })
    end
  end

end
