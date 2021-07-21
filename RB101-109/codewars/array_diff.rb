# Your goal in this kata is to implement a difference function, which subtracts one list from another and returns the result.
# It should remove all values from list a, which are present in list b keeping their order.
# If a value is present in b, all of its occurrences must be removed from the other.

def array_diff(a, b)
  a - b
end

p array_diff([1,2], [1])
p array_diff([1,2,2], [1])
p array_diff([1,2,2], [2])
p array_diff([1,2,2], [])
p array_diff([], [1,2])
p array_diff([1,2,3], [1,2])

# option 2
def array_diff(a, b)
  b.each { |num| a.delete(num) }
  a
end
