# Sort an array of passed in values using merge sort. You can assume that this array may contain only
# one type of data. And that data may be either all numbers or all strings.

# Merge sort is a recursive sorting algorithm that works by breaking down the array elements into nested
# sub-arrays, then recombining those nested sub-arrays in sorted order. It is best shown by example. For
# instance, let's merge sort the array [9,5,7,1]. Breaking this down into nested sub-arrays, we get:

# [9, 5, 7, 1] ->
# [[9, 5], [7, 1]] ->
# [[[9], [5]], [[7], [1]]]

# We then work our way back to a flat array by merging each pair of nested sub-arrays:

# [[[9], [5]], [[7], [1]]] ->
# [[5, 9], [1, 7]] ->
# [1, 5, 7, 9]

def merge(arr1, arr2)
  combo = arr1.dup + arr2.dup
  result = []
  (0...combo.size).each { |idx| result << combo.delete_at(combo.index(combo.min)) }
  result
end

def merge_sort(arr)
  size = arr.size
  return arr if size / 2 == 0
  midpoint = size.even? ? (size / 2) - 1 : size / 2
  merge(merge_sort(arr[0..midpoint]), merge_sort(arr[midpoint + 1..-1]))
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
