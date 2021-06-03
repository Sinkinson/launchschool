# Write a method that takes one argument -- an array containing integers
# have it return the average of all the numbers in the array

def average(array)
  total = 0
  array.each { |num| total += num }
  total / array.size
end

# faster method
# def average(array)
#   array.inject(:+) / array.size
# end

# test cases
puts average([1, 6]) == 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
