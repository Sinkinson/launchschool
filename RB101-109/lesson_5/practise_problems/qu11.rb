# use a combination of methods, including select or reject, to return a new array
# identical in structure to the original but containing only the integers that are
# multiples of three

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr2 = arr.map do |sub_array|
  sub_array.select do |integer|
    integer % 3 == 0
  end
end

p arr2
