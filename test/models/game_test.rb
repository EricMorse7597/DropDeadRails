require 'test_helper'

class GameTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @game = @user.games.build(playerID: @user.id, winnerID: @user.id, winningScore: 126)
  end

  test 'should be valid' do
    assert @game.valid?
  end

  test 'winner ID should be present' do
    @game.playerID = @user.id
    @game.winnerID = nil
    assert_not @game.valid?
  end

  test 'score should be positive' do
    @game.winningScore = 0
    assert_not @game.winningScore.positive?
  end
end
