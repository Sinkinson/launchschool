# Write a method called map that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return
# a new Array that contains the return values produced by the block for each element of the original Array.

# If the Array is empty, map should return an empty Array, regardless of how the block is defined.

# Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until to iterate through the Array
# passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

def map(collection)
  collection.each_with_object([]) do |element, result|
    result << yield(element)
  end
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

# option 2
def map(array)
  result = []
  array.each { |item| result << yield(item) }
  result
end
