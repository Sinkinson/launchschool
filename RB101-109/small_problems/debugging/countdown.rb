# Our countdown to launch isn't behaving as expected. Why? Change the code so that our program successfully counts down from 10 to 1.

def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  decrease(counter)
end

puts 'LAUNCH!'

# solution 1
def decrease(counter)
  counter - 1
end

counter = 10

10.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'

# solution 2
counter = 10

10.times do
  puts counter
  counter -= 1
end

puts 'LAUNCH!'
