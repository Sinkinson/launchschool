# How does count treat the blocks return value?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# "if a block is given, 'count' counts the number of elements for which the
# block returns a true value"

# will return an integer value of the amount of strings that have a length
# less than 4. So in this case 2
# count is seeing if the element returned from the block is truthy
