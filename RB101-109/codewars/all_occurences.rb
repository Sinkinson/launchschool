# Given an array of integers and an integer n, find all occurrences of n in the 
# given array and return another array containing all the index positions of n in the given array.
# If n is not in the given array, return an empty array [].
# Assume that n and all values in the given array will always be integers.

def find_all(arr, n)
  idx_arr = arr.map.with_index do |num, index|
    num == n ? index : nil
  end
  idx_arr.delete(nil)
  idx_arr
end

# Test case
p find_all([6, 9, 3, 4, 3, 82, 11], 3) # = [2, 4]

# refactor

def find_all(arr, n)
  arr.map.with_index { |num, idx| num == n ? idx : nil }.compact
end

# compact returns a new array containing all non-nil elements from self
