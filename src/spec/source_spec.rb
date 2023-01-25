require_relative '../classes/source'
require_relative '../../item'
require 'rspec'

describe Source do
  describe 'class' do
    it 'creates a new Source item' do
      source = Source.new('facebook')
      expect(source.name).to eq('facebook')
    end

    it 'creates a new Source name' do
      source = Source.new('facebok')
      expect(source.items).to eq([])
    end

    it 'generate a random id' do
      source = Source.new('facebook')
      allow(source).to receive(:rand).and_return(5)
      result = source.send(:generate_id)
      expect(result).to eq(5)
    end

    it 'add random source' do
      item = Item.new('archived', DateTime.now.to_s)
      source = Source.new('facebook', id: 10)
      source.add_item(item)
      expect(source.items).to include(item)
    end
  end
end
