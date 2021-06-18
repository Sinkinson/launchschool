# Write a method that returns the next to last word in the string passed to it
# as an argument. Words are any sequence of non-blank characters.
# You may assume the input string will always contain at least two words

def penultimate(string)
  split_string = string.split
  split_string[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# Write a method that retrieves the middle word of a phrase or sentence. What edge cases
# need to be considered? It should be able to handle single word strings and empty strings

def penultimate(string)
  return string if string.split.size == 1 || string.empty?
  middle = (string.split.size / 2)
  split_string = string.split
  split_string[middle]
end

# refactor

def penultimate(string)
  return string if string.split.size == 1 || string.empty?
  string.split[string.split.size / 2]
end

p penultimate('last word') == 'word'
p penultimate('Launch School is great!') == 'is'
p penultimate('Hello') == 'Hello'
p penultimate('Launch School is really great') == 'is'
p penultimate('') == ''
