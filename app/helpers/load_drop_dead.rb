require_relative 'DieClass'
require_relative 'PlayerClass'

class AutoDropDead
  def play_game(sides, dice_count, player_count)
    activePlayers = []
    deadPlayers = []

    # Create the die
    commonDie = Die.new(sides)

    # Create the players
    (1..player_count).each do |i|
      i -= 1
      activePlayers.push(Player.new(dice_count, commonDie, i + 1))
    end

    # main game loop
    turnCounter = 1
    while activePlayers.length.positive?
      # puts("~~~~~~~~ Turn #{turnCounter} ~~~~~~~~~~~~")

      # Loop through remaining players and have them roll their dice
      (1..activePlayers.length).each do |i|
        i -= 1
        # puts("Player #{activePlayers[i].pid}")
        activePlayers[i].RollDice()
        # puts("Current Score: #{activePlayers[i].score}\n\n")
      end

      # Go through the remaining players and remove any dead players from the active list
      alivePlayers = []
      activePlayers.each do |player|
        if player.isAlive == false
          deadPlayers.push(player)
          # puts("Player #{player.pid} has dropped dead.")
        else
          alivePlayers.push(player)
        end
      end
      activePlayers = alivePlayers

      # Increment the turn counter
      turnCounter += 1
    end

    # Print the results
    # puts("\n~~~~~~~~~~ Results ~~~~~~~~~~~~")
    deadPlayers = deadPlayers.sort_by(&:pid) # sort the players by pid
    winningPlayer = nil
    # Loop through dead players to show their score and find the player with the highest score
    deadPlayers.each do |player|
      # puts("Player #{player.pid} score: #{player.score}")

      if winningPlayer.nil?
        winningPlayer = player
      elsif winningPlayer.score < player.score
        winningPlayer = player
      end
    end

    # display winning player
    # puts("\nPlayer #{winningPlayer.pid} wins!!!")
    { winnerID: winningPlayer.pid, winningScore: winningPlayer.score }
  end
end
