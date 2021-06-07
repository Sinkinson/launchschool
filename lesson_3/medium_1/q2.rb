# the following code will produce an error. Why and how can you fix it

puts "the value of 40 + 2 is " + (40 + 2)

# It will produce an error because you are trying to concatenate an integer and a string

# ways to fix it
puts "the value of 40 + 2 is " + (40 + 2).to_s

puts "the value of 40 + 2 is #{40 + 2}"
