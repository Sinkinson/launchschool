# Write a method that takes an integer as an argument, and returns and array of all the intgers in sequence
# between 1 and the argument. You may assume the argument will always be a valid integer that is greater
# than zero

def sequence(integer)
  numbers = []
  for num in 1..integer
    numbers << num
  end
  numbers
end

# test cases
p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

# LS way

def sequence(number)
  (1..number).to_a
end

# Alter the method to allow negative numbers

def sequence(number)
  number < 0 ? (number..1).to_a : (1..number).to_a
end
