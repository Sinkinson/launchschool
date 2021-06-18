# Given a string of words separated by spaces, write a method that takes this string
# of words and returns a string in which the first and last of the letters of every
# word are swapped.
# You can assume that every word contains at least one letter and the string will
# contain at least one word and each string contains nothing but words and spaces.

def swap(string)
  word_array = string.split(' ')
  word_array.each do |word|
    first_character = word[0]
    second_character = word[-1]
    word[0] = second_character
    word[-1] = first_character
  end
  word_array.join(' ')
end

# refactored

def swap(string)
  word_array = string.split(' ')
  word_array.each do |word|
    word[0], word[-1] = word[-1], word[0]
  end
  word_array.join(' ')
end

# test cases
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

# LS way

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end
