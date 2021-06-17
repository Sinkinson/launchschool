# Write a method that takes an array as an argument and reverses its elements in place
# that is, mutate the array passed into this method
# the return value should be the same array object
# you may not use the reverse method

def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end

# sets one index to point to beginning of the array
# sets another index to point to the end of the array
# walks through the array changing the elements at each step
# since we update the array in place, the method is named reverse!
# the loop terminates at the middle of the list as we gave the 
# while loop the condition of the left_index being less than the
# array size divided by 2

# test cases

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true
