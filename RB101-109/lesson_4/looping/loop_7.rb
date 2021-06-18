objects = ['hello', :key, 10, []]
counter = 0

loop do
  break if counter == objects.size
  puts objects[counter].class
  counter += 1
end

# we can also call class on the return value
# and therefore print out the classes of each
# object within the array

# => string
#    symbol
#    integer
#    array
