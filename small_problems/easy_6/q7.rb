# Write a method that takes an array as an argument, and returns two arrays
# as a pair of nested arrays.
# If the original array contains an odd number of elements, the middle element
# should be placed in the first half array

def halvsies(array)
  index_size = array.index(array.last)
  new_array = array.partition do |element| 
    array.index(element) <= (index_size / 2)
  end
  new_array
end

# use partition to provide us two arrays back
# the block asks if the elements index is less than or equal to where the middle
# of the array is

# test cases
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end

# the ceil method returns the smallest whole integer greater than or equal to the value
# so if we had a value of 2.5 it will round that up to 3. This ensures the first half
# of our array is larger than our second half
# the slice method is then used to return the section of the array we want

# divide by 2.0 because otherwise we would get a whole number and no remainder therefore ceil
# would not work. So if we divided 5 by 2 we would get 2 back instead of 2.5
