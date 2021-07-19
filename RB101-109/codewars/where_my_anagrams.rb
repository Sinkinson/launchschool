# Write a function that will find all the anagrams of a word from a list.
# You will be given two inputs a word and an array with words. You should
# return an array of all the anagrams or an empty array if there are none.

def anagrams(word, words)
  words.select { |element| element.chars.sort == word.chars.sort }
end

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada'])
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer'])
p anagrams('laser', ['lazing', 'lazy',  'lacer'])

# option 2
def anagrams(word, words)
  result = []

  words.each do |element|
    result << element if element.chars.sort == word.chars.sort
  end     

  result
end