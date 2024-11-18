module GamesHelper
  def winner(winnerID)
    return 'You' if winnerID == 1

    "Player #{winnerID}"
  end
end
