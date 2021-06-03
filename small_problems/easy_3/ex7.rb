# write a method that returns an array that contains every other element
# of an array that is passed in as an argument
# The values in the returned list should be those that are in the 1st, 3rd, 5th...
# elements of the argument array

def oddities(array)
  new_arr = []
  array.each_with_index do |element, index|
    new_arr << element if index.even?
  end
  new_arr
end

# test cases
puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

# LS way
# create a counter instead of actually using the index itself

# def oddities(array)
#   odd_elements = []
#   index = 0
#   while index < array.size
#     odd_elements << array[index]
#     index += 2
#   end
#   odd_elements
# end

# another possible solution

# def oddities(arr)
#   new_arr = []
#   arr.select do |element| 
#     new_arr << element if arr.index(element).even?
#   end
# end

# the index method above is supplied the argument of the element
# it is currently iterating over
# so if we were to just use .index(3) it would return the index value
# for wheverever 3 is in the array