class Die 
    @numSides
    
    # initalize the number of side 
    def initialize(numSides)
        @numSides = numSides
    end

    # generate a random number from 1 to numSides
    def RollDie()
        return 1 + rand(@numSides)
    end
end