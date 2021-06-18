# Write a method that takes a single string argument and returns a new string that
# contains the original value of the argument with the first character of every word
# capitalized and all other letters lowercase.
# You may assume that words are any sequence of non-blank characters

def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

# # test cases
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# without using the capitalize method

def word_cap(string)
  captial_arr = string.split.map do |word|
    word[0].upcase + word[1..-1].downcase
  end
  captial_arr.join(' ')
end

# another possible solution

def word_cap(string)
  string.downcase!
  string_arr = string.split
  string_arr.each do |word|
    word[0] = word[0].upcase
  end
  string_arr.join(' ')
end
