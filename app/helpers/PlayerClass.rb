class Player
  attr_accessor :score, :isAlive, :pid

  # Initialize the player with inputted parameters, 0 score, and as being alive
  def initialize(numDice, die, pid)
    @numDice = numDice
    @die = die
    @pid = pid

    @score = 0
    @isAlive = true
  end

  # Roll remaining dice
  def RollDice
    sumForRoll = 0
    rolledBad = false

    # Loop numDice times and generate a random number for each
    for i in 0..@numDice - 1 do
      result = @die.RollDie()
      puts("die #{i + 1}: #{result}")

      # If the result of the dice is 2 or 5, subtract one of the die, and trigger the rolledBad flag
      if [2, 5].include?(result)
        @numDice -= 1
        rolledBad = true
      else # if the result isn't a 2 or 5 add it to current roll sum
        sumForRoll += result
      end
    end

    # if we didn't roll a bad number, add the roll sum to total score
    @score += sumForRoll if rolledBad == false

    # If the player is out of dice, toggle the alive flag
    return unless @numDice <= 0

    @isAlive = false
  end
end
