# Write a method that takes an array of integers as input, multiplies
# all the numbers together, divides the result by the number of entries
# in the array, and then prints the result rounded to 3 decimal places.
# Assume the array is not empty

def show_multiplicative_average(array)
  product = array.inject(:*) / array.size.to_f
  puts "The result is #{format('%.3f', product)}"
end

# test cases
show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# LS way

def show_multiplicative_average(numbers)
  product = 1.to_f
  numbers.each { |number| product *= number }
  average = product / numbers.size
  puts "The result is #{format('%.3f', average)}"
end
