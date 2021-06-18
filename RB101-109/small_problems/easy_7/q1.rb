# Write a method that combines two arrays passed in as arguments and returns a new array
# that contains all elements from both array arguments, with the elements taken in alteration
# You may assume that both input arrays are non-empty, and they have the same number of elements

def interleave(array_1, array_2)
  combined_array = []
  loop do
    combined_array << array_1.shift
    combined_array << array_2.shift
    break if array_2.empty?
  end
  p combined_array
end

# line 8 and 9 could be: combined_array << array_1.shift << array_2.shift

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# LS way

def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end

# using zip method

def interleave(array_1, array_2)
  array_1.zip(array_2).flatten
end
