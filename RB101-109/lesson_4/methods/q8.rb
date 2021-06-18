# How does take work? Is it destructive?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# take returns a new array containing the first n element of self,
# where n is a non negative integer
# it is therefore not destructive

# in short: provide an integer argument with the amount of elements
# you want to move to a new array
# the above would return [1, 2]
