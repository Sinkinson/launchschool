# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What would happen if we added a play method to the Bingo class, keeping in mind that there
# is already a method of this name in the Game class that the Bingo class inherits from.

# An object instantiated from the Bingo class would then use the the play method in the Bingo class 
# instead of the Game class, as the method lookup path always looks in its own class first
