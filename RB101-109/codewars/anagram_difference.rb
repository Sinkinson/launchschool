# Given two words, how many letters do you have to remove from them to make them anagrams?
# For example:
# First word -> codewars
# Second word -> hackerrank
# 4 letters ('odws') have to be removed from codewars
# 6 letters ('hakrnk') have to be removed from hackerrank
# so the total is 10 letters to be left with ('cear') in both words

def anagram_difference(w1, w2)
  chars = w1.chars
  count = 0

  chars.each do |char|
    w2.include?(char) ?  w2.sub!(char, "!") : count += 1
  end
  
  w2.scan(/[a-z]/).size + count
end

p anagram_difference('codewars', 'hackerrank') == 10
p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2

# for the second method call, where two strings are given, an empty array is formed because chars is called on ''
# so when the each method is called on the empty array it never goes into the if statement because there is
# nothing to iterate over
