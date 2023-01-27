require 'rspec'
require '../classes/book'

describe Book do
  before :each do
    @book = Book.new('2021/02/03', 'Math Lens', 'Good')
  end

  describe '#new' do
    it 'returns a new book object' do
      @book.should be_an_instance_of Book
    end
  end

  describe '#publish_date' do
    it 'returns the correct published date' do
      @book.publish_date.should == '2021/02/03'
    end
  end

  describe '#cover_state' do
    it 'returns the correct cover_state' do
      @book.cover_state.should == 'Good'
    end
  end
end
