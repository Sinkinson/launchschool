# what happens when we modify an array while we are iterating over it?
# what would be the output of this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# output
# 1
# 3

# what would this code output?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# output
# 1
# 2
