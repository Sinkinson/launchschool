# create a method that takes one integer as an argument, can be positive negative or zero
# the method returns true if the numbers absolute value is odd
# assume the argument is a valid integer value. No need to test prior
# you are not allowed to use the methods odd? or even? in your solution

def is_odd?(number)
  number % 2 != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
