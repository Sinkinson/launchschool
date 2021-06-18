# Write a method that takes two array arguments in which each array contains a list
# of numbers, and returns a new array that contains the product of every pair of numbers
# that can be formed between the elements of the two arrays. The results should be sorted
# by increasing value.


def multiply_all_pairs(array_1, array_2)
  finaly_array = array_1.product(array_2).map do |sub_array|
    sub_array.inject(:*)
  end
  final_array.sort
end

# refactor
def multiply_all_pairs(array_1, array_2)
  array_1.product(array_2).map { |sub_array| sub_array.inject(:*) }.sort
end

multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# LS way

def multiply_all_pairs(array_1, array_2)
  products = []
  array_1.each do |item_1|
    array_2.each do |item_2|
      products << item_1 * item_2
    end
  end
  products.sort
end
