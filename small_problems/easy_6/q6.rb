# Write a method that takes two arrays as arguments and returns an array
# that contains all of the values from the argument arrays
# there should be no duplication of values in the returned array

def merge(arr_1, arr_2)
  arr_1.concat(arr_2).uniq
end

merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# LS way

def merge(array_1, array_2)
  array_1 | array_2
end

# utilises the array method |
# gives the set union of two arrays, so it contains no duplicates
# it means we get back all the elements both arr_1 and arr_2 might
# contain, but without duplicates
