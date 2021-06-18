# Write a method that takes one argument, 
# a string containing one or more words, and 
# returns the given string with words that 
# contain five or more characters reversed. 
# Each string will consist of only letters and 
# spaces. Spaces should be included only when more 
# than one word is present.


# define a method(string with one or more words)
#  - split the string into an array
#  - iterate through each word in the array
#  - see if each word contains more than 5 characters
#  - if it does contain more than 5 characters then reverse it
#  - use map method to return a new array with some of the words reversed
#    else just return the word
#  - then join all the words in an array with a space as the delimiter
# end

def reverse_words(string)
  string.split.map { |word| word.size >= 5 ? word.reverse : word }.join(' ')
end

# to maybe make it slightly more readable could save the return to
# a variable and then use the join method on that variable instead
# of appending it to the end.

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

=begin 

LS way
create a new empty array and then use the shovel operator to put the words inside

def reverse_words(string)
  words = []

  string.split.each do |word|
    word.reverse! if word.size >= 5
    words << word
  end

  words.join(' ')
end
=end