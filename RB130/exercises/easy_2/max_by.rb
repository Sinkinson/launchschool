# The Enumerable#max_by method iterates over the members of a collection, passing each element to the associated block. It then returns
# the element for which the block returned the largest value.

# Write a method called max_by that behaves similarly for Arrays. It should take an Array and a block, and return the element that
# contains the largest value.

# If the Array is empty, max_by should return nil.

# Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until to iterate through the Array
# passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

def max_by(array)
  max = array[0]
  array.each { |element| max = element if yield(element) > yield(max) }
  max
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil

# option 2
def max_by(collection)
  result = []
  return nil if collection.empty?
  collection.each { |item| result << yield(item) }
  result.zip(collection).sort_by { |arr| arr.first }.last[1]
end

# option 3
def max_by(array)
  return nil if array.empty?

  max_element = array.first
  largest = yield(max_element)

  array[1..-1].each do |item|
    yielded_value = yield(item)
    if largest < yielded_value
      largest = yielded_value
      max_element = item
    end
  end

  max_element
end
