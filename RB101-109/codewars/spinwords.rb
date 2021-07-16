# Write a function that takes in a string of one or more words, and returns the same
# string, but with all five or more letter words reversed (like the name of this kata).
# strings passed in will consist of only letters and spaces
# spaces will be included only when more than one word is present

def spin_words(string)
  string.split(' ').map { |word| word.size >= 5 ? word.reverse : word }.join(' ')
end

p spin_words("Welcome")
p spin_words("Hey fellow warriors")
