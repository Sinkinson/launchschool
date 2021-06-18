# Write a method that takes an array of numbers and then returns the sum of sums
# of each leading subsequence for that array. You may assume that the array always
# contains at least one number.

def sum_of_sums(array)
  counter = 1
  sum_array = []
  loop do
    sum_array << array[0, counter]
    counter += 1
    break if array.size == sum_array.size
  end
  sum_array.flatten.sum
end

# test cases
p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

# LS way

def sum_of_sums(numbers)
  sum_total = 0
  accumulator = 0

  numbers.each do |num|
    accumulator += num
    sum_total += accumulator
  end

  sum_total
end

# using the slice method

def sum_of_sums(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|
    sum_total += numbers.slice(0, count).reduce(:+)
  end
  sum_total
end

# and using the times method

def sum_of_sums(numbers)
  sum = 0
  numbers.size.times { |counter| sum += numbers[0..counter].sum }
  sum
end
