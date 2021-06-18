# Method calls can take expressions as arguments. Suppose we define a method called rps
# it follows the rules of rock paper scissors.
# The twist is that it declares whatever hand was used in the tie as the result of that tie

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

# what would this code output?
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# => "paper"
