require 'rspec'
require_relative '../classes/label'
require_relative '../../item'

describe Label do
  context 'Create a new object Label' do
    a_label = Label.new('LabelTitle', 'Color')

    it 'should print the label\'s title' do
      expect(a_label.title).to eq 'LabelTitle'
    end

    it 'should print the label\'s color' do
      expect(a_label.color).to eq 'Color'
    end
  end
end
