# What is the return value of reject in the following code. Why?

[1, 2, 3].reject do |num|
  puts num
end

# Can think of reject as the opposite to select. Returns a new array of 
# the elements in the array for which the block returns false.
# so because puts returns 'nil' all the integers will be put into a new 
# array. So the output will be [1, 2, 3]

# in short, if the element returns falsey it is selected
