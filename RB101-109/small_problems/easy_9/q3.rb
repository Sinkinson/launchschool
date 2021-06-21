# Write a method that takes a number as an argument. If the argument is a positive
# number, return the negative of that number. If the number is 0 or negative, return
# the original number

def negative(integer)
integer < 0 ? integer : -integer
end

# test cases
p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby

# another solution

def negative(number)
  -number.abs
end

# abs returns the absolute value of a number -- the non-negative value of a number without regard to its sign
# so in this case it just strips the number of its sign if it has one and then prepends one
