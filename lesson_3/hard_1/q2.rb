# What is the result of the last line of code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# output is "hi there" because informal_greeting is a reference to 
# the original object. Then we use the shovel operator on it
# which is destructive