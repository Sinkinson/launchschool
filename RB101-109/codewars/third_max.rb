# Given integer array nums, return the third maximum number in this array. 
# If the third maximum does not exist, return the maximum number.
# You are not allowed to sort the array

def third_max(array)
  arr = array.dup
  third_max_num = 0

  3.times do
    third_max_num = arr.max_by { |number| number.ord }
    arr.delete(third_max_num)
  end

  third_max_num == nil ? array.max : third_max_num
end

p third_max([3,2,1]) == 1
p third_max([1,2]) == 2
p third_max([2,2,3,1]) == 1
p third_max([1, 3, 4, 2, 2, 5, 6]) == 4
