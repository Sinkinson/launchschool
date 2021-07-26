# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.
# Do not use the method Array#rotate or Array#rotate! for your implementation.
# Example:
# rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]                 # => true

def rotate_array(array)
  dup_arr = array.dup
  dup_arr << dup_arr.shift
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]
p x == [1, 2, 3, 4]

# LS way
def rotate_array(array)
  array[1..-1] + [array[0]]
end

# remeber you can only use + with two arrays so thats why array[0] is encased in brackets

# further exploration
# write a method that rotates a string
def rotate_string(string)
  string[1..-1] + string[0]
end

# write a method that rotates an integer
def rotate_integer(int)
  rotate_string(int.to_s).to_i
end
