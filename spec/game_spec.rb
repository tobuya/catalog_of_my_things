require_relative '../classes/game'
require 'time'

describe Game do
  context 'When testing the Game class' do
    game = Game.new(20, '2020-10-02', 'Y', '2020-02-10')

    it 'Should check if game is multiplayer Y' do
      expect(game.multiplayer).to eq 'Y'
    end

    it 'should detect the date the album was published' do
      expect(Date.parse(game.publish_date)).to eq Date.parse('2020-10-02')
    end
    it 'Should be archivable' do
      expect(game.send(:can_be_archived?)).to be(true)
    end
  end
end
