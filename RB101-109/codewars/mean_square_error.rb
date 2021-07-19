# Complete the function that:

# - accepts two integer arrays of equal length
# - compares the value each member in one array to the corresponding member in the other
# - squares the absolute value difference between those two values
# - and returns the average of those squared absolute value difference between each member pair.

def solution(arr1, arr2)
  result = []

  (0..arr1.size - 1).each do |index|
    abs_difference = (arr1[index] - arr2[index]).abs
    result << abs_difference ** 2
  end

  result.sum.to_f / result.size
end

p solution([1, 2, 3], [4, 5, 6])
p solution([10, 20, 10, 2], [10, 25, 5, -2])
p solution([-1, 0], [0, -1])
