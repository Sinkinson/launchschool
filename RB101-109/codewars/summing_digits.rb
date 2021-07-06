# Write a function named sumDigits which takes a number as input 
# and returns the sum of the absolute value of each of the number's 
# decimal digits.

def sum_digits(number)
  number.to_s.delete('-').split(//).map(&:to_i).inject(:+)
end

# Test cases
p sum_digits(10)  # Returns 1
p sum_digits(99)  # Returns 18
p sum_digits(-32) # Returns 5

# Can also remove the delete('-') method call as when to_i is called on '-' it
# is converted to 0
