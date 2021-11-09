# The following code:

def my_method(array)
  if array.empty?
    []
  elsif
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

# is expected to print:

# []
# [21]
# [9, 16]
# [25, 36, 49]

# However, it does not. Obviously, there is a bug. Find and fix the bug, then explain why the buggy program printed the results it did.

def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

# When no expression if provided to the elsif branch it looks to the next line and evaluates that. In this case the map method call. The map
# method always returns an array, which is truthy, so the elsif branch will run if the array passed in is not empty (first branch would run in that case).
# Because the map method is used as the expression there is no code in the elsif branch so therefore nil is returned. If a branch has no code and is
# executed then nil will always be returned.
