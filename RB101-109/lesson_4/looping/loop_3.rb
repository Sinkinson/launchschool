counter = 0

loop do
  puts 'Hello!'
  counter += 1
  break if counter == 5
end

# if we want to keep track of what iteration we are on then 
# we can create a counter. Notice that we initialise counter
# on the outside of the loop. If we initialised it on the inside
# it would be reset to zero on each iteration.
