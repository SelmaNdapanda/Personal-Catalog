require_relative '../classes/movie'
require_relative '../../item'
require 'rspec'

describe Movie do
  describe 'class' do
    it 'creates a new Movie name' do
      movie = Movie.new('Stars')
      expect(movie.name).to eq('Stars')
    end

    it 'creates a new Movie name' do
      movie = Movie.new('Stars')
      expect(movie.items).to eq([])
    end

    it 'generate a random id' do
      movie = Movie.new('Stars')
      allow(movie).to receive(:rand).and_return(5)
      result = movie.send(:generate_id)
      expect(result).to eq(5)
    end

    it 'add random item' do
      item = Item.new('archived', DateTime.now.to_s)
      movie = Movie.new('Stars', id: 10)
      movie.add_item(item)
      expect(movie.items).to include(item)
    end
  end
end
