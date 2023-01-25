require_relative '../classes/game'
require_relative '../../item'
require 'rspec'

describe Game do
  context 'instantiate game object' do
    game = Game.new(true, '2022-05-20')

    it 'should print multiplayer boolean' do
      expect(game.multiplayer).to eq true
    end

    it 'should print last played date' do
      expect(game.last_played_at).to eq '2022-05-20'
    end
  end
end