# Write a method that takes one argument, 
# a string, and returns a new string with 
# the words in reverse order.


def reverse_sentence(string)
  string.split(' ').reverse.join(' ')
end

# can also just use split without a delimiter and it will split on each white space

puts reverse_sentence('') == ''
reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'