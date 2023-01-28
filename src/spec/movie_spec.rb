require_relative './spec_helper'

RSpec.describe Movie do
  describe '#initialize' do
    it 'Should be silent' do
      movie = Movie.new(false, 'Nothing was the same', '2022-02-01')
      expect(movie.silent).to eq(false)
    end
  end
  describe 'can be archive method' do
    it 'can be archive the movie' do
      movie = Movie.new(true, 'The Enchanter', '2011-11-16')
      result = movie.send(:can_be_archived?)
      expect(result).to eq(true)
    end
  end
end
