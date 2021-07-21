# You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the
# integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make
# this happen, return -1.

def find_even_index(arr)
  arr.each_with_index do |num, idx|
    left_side = arr[0...idx]
    right_side = arr[idx + 1..-1]
    return idx if left_side.sum == right_side.sum
  end
  -1
end
