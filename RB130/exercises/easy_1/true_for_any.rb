# Write a method called any? that behaves similarly for Arrays. It should take an Array as an argument, and a block.
# It should return true if the block returns true for any of the element values. Otherwise, it should return false.
# Your method should stop processing elements of the Array as soon as the block returns true.
# If the Array is empty, any? should return false, regardless of how the block is defined.
# Your method may not use any standard ruby method that is named all?, any?, none?, or one?.

def any?(array)
  array.each { |item| return true if yield(item) }
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false

# option 2
def any?(array)
  counter = 0

  while counter < array.size 
    return true if yield(array[counter])
    counter += 1
  end

  false
end
