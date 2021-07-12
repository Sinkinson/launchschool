# The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence
# in an array of integers:

# e.g. [-2, 1, -3, 4, -1, 2, 1, -5, 4] should be 6: [4, -1, 2, 1]
# if array is all positive numbers that it is just the sum of the whole array.
# if the array is only negative numbers return 0
# if array is empty return 0

def max_sequence(array)
highest_total = 0
loop do
  break if array.empty?
  break if array.all? { |num| num.negative? }
  counter = 0
  loop do
    sum = array[0..counter].sum
    highest_total = sum if sum > highest_total
    counter += 1
    break if counter > array.size
  end
  array.shift
end
highest_total
end

# Test cases
p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12

# LS way

def max_sequence(array)
  return 0 if array.all? { |number| number < 0 }
  result = []
  (0..(array.size - 1)).each do |index1|
    (index1..(array.size - 1)).each do |index2|
      result << array[index1..index2]
    end
    result.max_by { |sub_array| sub_array.sum }.sum
  end
end
