# You are going to be given an array of integers. Your job is to take that array and find
# an index where the sum of the integers to the left of N is equal to the sum of the integers
# integers to the right of N. If there is no index that would make this happen, return -1

# For example:
# Let's say you are given the array [1,2,3,4,3,2,1]
# Your method will return the index 3, because at the third position of the array, the sum on
# the left side of the index [1,2,3] and the sum on the right of the index [3,2,1] both equal 6

# Another example:
# you are given the array [20,10,-80,10,10,15,35]
# at index 0 the left side is []
# the right side is [10,-80,10,10,15,35]
# they both equal 0 when added (empty arrays are equal to 0 in this problem)
# index 0 is the place where both the left side and right side are equal

def find_even_index(array)
  array.each_with_index do |_, idx|
    left_side = array[0, idx]
    right_side = array[idx + 1..-1]
    return idx if left_side.sum == right_side.sum
  end
  return -1
end

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
