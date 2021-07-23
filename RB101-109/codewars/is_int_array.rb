# Write a function with the signature shown below:

# def is_int_array(arr)
#   true
# end

# returns true / True if every element in an array is an integer or a float with no decimals.
# returns true / True if array is empty.
# returns false / False for every other input.

def is_int_array(arr)
  return false if arr == nil || arr == ''
  return true if arr.empty?
  no_floats = arr.map(&:to_i)
  no_floats == arr
end

p is_int_array([]) == true
p is_int_array([1, 2, 3, 4]) #== true
p is_int_array([-11, -12, -13, -14]) == true
p is_int_array([1.0, 2.0, 3.0]) == true
p is_int_array([1, 2, nil]) == false
p is_int_array(nil) == false
p is_int_array("") == false
p is_int_array([nil]) == false
p is_int_array([1.0, 2.0, 3.0001]) == false
p is_int_array(["-1"]) == false

# option 2
def is_int_array(arr)
  arr.is_a?(Array) && arr.all? { |x| x.is_a?(Integer) || x.is_a?(Float) && x.to_i == x }
end
