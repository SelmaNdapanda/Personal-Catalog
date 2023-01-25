require 'rspec'
require_relative '../classes/author'
require_relative '../../item'

describe Author do
  context 'instantiate Author object' do
    author = Author.new('FirstName', 'LastName')

    it 'should print authors first name' do
      expect(author.first_name).to eq 'FirstName'
    end

    it 'should print authors last name' do
      expect(author.last_name).to eq 'LastName'
    end
  end
end
