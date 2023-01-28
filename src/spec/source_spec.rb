require_relative './spec_helper'

describe Source do
  describe 'class' do
    it 'creates a new Source name' do
      source = Source.new('Netflix')
      expect(source.name).to eq('Netflix')
    end

    it 'items of source are empty' do
      source = Source.new('Netflix')
      expect(source.items).to eq([])
    end

    it 'add random item' do
      item = Item.new(true, '2022-02-01')
      source = Source.new('Netflix', id: 10)
      source.add_item(item)
      expect(source.items).to include(item)
    end
  end
end
