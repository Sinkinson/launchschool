# Complete the function that takes an array of words. You must concatenate the nth letter
# from each word to construct a new word which should be returned as a string, where n 
# is the position of the word in the list.

# For example: ['yoda', 'best', 'has'] -> 'yes'
# y = 0
# e = 1
# s = 2

def nth_char(words)
  counter = 0
  string = ''

  words.each do |word|
    string << word[counter]
    counter += 1
  end
  string
end

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) == 'Codewars'

# concise solution

def nth_char(words)
  words.map.with_index { |word, index| word[index] }.join
end
