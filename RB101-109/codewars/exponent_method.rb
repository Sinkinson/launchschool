# Create a method called "power" that takes two integers and returns the value of
# the first argument raised to the power of the second. Return nil if the second
# argument is negative.

# Note: The ** operator has been disabled.

def power(base, exponent)
  return 1 if exponent == 0
  return nil if exponent.negative?

  base_case = base

  (exponent - 1).times do
    base *= base_case
  end

  base
end

p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16
