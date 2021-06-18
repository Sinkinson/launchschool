# See if you can work out what would be returned when sort is called
# on this array of arrays

p [['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort

# => [['a', 'car', 'd'], ['a', 'car', 'd', 3], ['a', 'cat', 'b', 'c'], ['b', 2]]

# We know the comparing an integer with a string will cause an error 
# as it returns nil, the second element in ['b', '2'] was never 
# compared because 'b' comes after 'a' which the other sub-arrays have

# the 3 in one of the sub-arrays was also never compared because it was only compared
# in terms of length with the sub-array ['a', 'car', 'd']. The integer did not have to 
# be compared. Therefore, it was deemed larger
