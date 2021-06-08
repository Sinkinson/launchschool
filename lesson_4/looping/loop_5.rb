alphabet = 'abcdefghijklmnopqrstuvwxyz'
counter = 0

loop do
  break if counter == alphabet.size
  puts alphabet[counter]
  counter += 1
end

# here we create a loop to iterate over each character
# within the string and then puts out each one.
# We break from the loop when the counter we set
# reaches the size of the string

# to make the break statement a little more robust we could use
# break if counter >= alphabet.size
