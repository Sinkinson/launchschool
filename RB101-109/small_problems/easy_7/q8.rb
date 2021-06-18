# Write a method that takes two array arguments in which each array contains a list of numbers.
# Return a new array that contains the product of each pair of numbers from the arguments
# that have the same index.
# You may assume the arguments contain the same number of elements.

def multiply_list(array_1, array_2)
  new_array = array_1.zip(array_2)
  final_array = new_array.map do |sub_array|
    sub_array.inject(:*)
  end
  final_array
end

# refactored

def multiply_list(array_1, array_2)
  array_1.zip(array_2).map { |sub_array| sub_array.inject(:*) }
end

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# LS way

def multiply_list(list_1, list_2)
  products = []
  list_1.each_with_index do |item, index|
    products << item * list_2[index]
  end
  products
end
