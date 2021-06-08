loop do
  number = rand(1..10)   # a random number between 1 and 10
  puts 'Hello!'
  if number == 5
    puts 'Exiting...'
    break
  end
end

# on each iteration of the loop the number variable is assigned
# to a random number between 1 and 10. If it is assigned to 5 
# then the program puts the word "Exiting" and breaks out of the loop 
