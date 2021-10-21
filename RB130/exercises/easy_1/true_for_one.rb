# In the previous 3 exercises, you developed methods called any?, all?, and none? that are similar to the standard
# Enumerable methods of the same names. In this exercise, you will develop one last method from this family, one?.

# Enumerable#one? processes elements in a collection by passing each element value to a block that is provided in
# the method call. If the block returns a value of true for exactly one element, then #one? returns true. Otherwise,
# #one? returns false. Note in particular that #one? will stop searching the collection the second time the block returns true.

# Write a method called one? that behaves similarly for Arrays. It should take an Array as an argument, and a block.
# It should return true if the block returns true for exactly one of the element values. Otherwise, it should return false.

# Your method should stop processing elements of the Array as soon as the block returns true a second time.

# If the Array is empty, one? should return false, regardless of how the block is defined.

# Your method may not use any standard ruby method that is named all?, any?, none?, or one?.

def one?(collection)
  result = []
  collection.each do |item|
    result << item if yield(item)
    return false if result.size > 1
  end
  result.empty? ? false : true
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false

# option 2
def one?(collection)
  seen_one = false
  collection.each do |element|
    next unless yield(element)
    return false if seen_one
    seen_one = true
  end
  seen_one
end

# next method call is executed if the block returns false.
# If it returns true we see what seen_one is set to and return false if we have already seen one.
# We then set seen_one to true and go to the next iteration.
# At the end of the each method call we return true or false depending on if one true value was seen.
