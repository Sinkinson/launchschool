# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

# And another class:

class Bingo
  def rules_of_play
    #rules of play
  end
end

# What can we add to the Bingo class to allow it to inherit the play method from the Game class?

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# We can test this by just creating an instance of the Bingo class and calling the play method on it

game_of_bingo = Bingo.new
puts game_of_bingo.play  # => Start the game!
