# Write a method that takes an array and returns a new array with the elements
# of the original list in reverse order. Do not modify the original list
# you may not use the reverse method

def reverse(array)
  new_array = []
  array.each do |element|
    new_array.unshift(element)
  end
  new_array
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

# LS way

def reverse(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end

# reverse_each is like each, except it processes the element in reverse order
# reverse_each only applies to arrays

# same thing could also be achieved using each_with_object

def reverse(array)
  array.each_with_object([]) do |element, object|
    object.unshift(element)
  end
end

# and using the inject method

def reverse(array)
  array.inject([]) { |new_arr, element| new_arr.unshift(element) }
end
