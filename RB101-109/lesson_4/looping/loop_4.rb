counter = 0

loop do
  counter += 1
  next if counter.odd?
  puts counter
  break if counter > 5
end

# this is a simple loop that uses the next condition
# to skip over printing the integer if it is odd
# we put counter > 5 because 5 is an odd number so this
# condition would not be checked if it were counter == 5
