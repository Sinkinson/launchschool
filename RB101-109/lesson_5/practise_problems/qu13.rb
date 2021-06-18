# return a new array containing the same sub-arrays as the original but ordered logically
# by only taking into consideration the odd numbers they contain

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# output: [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

arr2 = arr.sort_by do |sub_array|
  sub_array.select do |num|
    num.odd?
  end
end

p arr2

# by performing selection on the sub-arrays that we are comparing, we can compare
# them based on the value of the odd integers alone
