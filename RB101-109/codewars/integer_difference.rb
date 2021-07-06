# Write a function that accepts two arguments: an array of integers and another integer (n).
# Determine the number of times where two integers in the array have a difference of n.

def int_diff(arr, n)
  arr.combination(2).count { |a, b| (a - b).abs == n }
end

# Test cases
p int_diff([1, 1, 5, 6, 9, 16, 27], 4)
p int_diff([1, 1, 3, 3], 2)

# The combination method with the given argument 2 returns every pair from the array.
# The block passed as an argument to the count method then takes the values from each 
# pair and subtracts them to see if they equal the given integer.
