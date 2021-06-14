# given this code, what would be the final values of a and b

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# arr => [4, [3, 8]]
# a => 2
# b => [3, 8]

# The value of a didn't change because we are not referencing a at any point
# the code arr[0] += 2 was modifying the array, arr not a
# we are assigning a new object at that index of the array, so instead of it containing
# a it now contains 4
# The value of b did change because b is an array and we are modifying that array by
# assigning a new value at index 0 of that array
