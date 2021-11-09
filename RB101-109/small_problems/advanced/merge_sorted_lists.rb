# Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains
# all elements from both arguments in sorted order.

# You may not provide any solution that requires you to sort the result array. You must build the
# result array one element at a time in the proper order.

# Your solution should not mutate the input arrays.

def merge(arr1, arr2)
  combo = arr1.dup + arr2.dup
  result = []
  (0...combo.size).each { |idx| result << combo.delete_at(combo.index(combo.min)) }
  result
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
p merge([1, 3], [2, 5, 7]) == [1, 2, 3, 5, 7]

# option 2: keeping track as you move through the array and add elements
def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end

# option 3
def merge(arr1, arr2)
  result = []
  return arr1 if arr2.empty?
  return arr2 if arr1.empty?
  min, max = arr1.first < arr2.first ? [arr1, arr2] : [arr2, arr1]
  (0...min.size - 1).each do |idx|
    numbers = max.select { |num| (min[idx]..min[idx + 1]).include? num }
    result << min[idx] if idx == 0
    result << numbers << min[idx + 1]
  end
  add_missing_numbers(result, max)
end

def add_missing_numbers(result, max)
  result.flatten!
  max.each { |num| result << num unless result.include? num }
  result
end
