# Write a function that, given a string of text (possibly with punctuation and line-breaks), returns an array of the
# top-3 most occurring words, in descending order of the number of occurrences.

# Assumptions:
# A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII. (No need to handle fancy punctuation.)
# Matches should be case-insensitive, and the words in the result should be lowercased.
# Ties may be broken arbitrarily.
# If a text contains fewer than three unique words, then either the top-2 or top-1 words should be returned, or an empty array if a text contains no words.
# Examples:
# top_3_words("In a village of La Mancha, the name of which I have no desire to call to
# mind, there lived not long since one of those gentlemen that keep a lance
# in the lance-rack, an old buckler, a lean hack, and a greyhound for
# coursing. An olla of rather more beef than mutton, a salad on most
# nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
# on Sundays, made away with three-quarters of his income.")
# # => ["a", "of", "on"]

# top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
# # => ["e", "ddd", "aa"]

# top_3_words("  //wont won't won't")
# # => ["won't", "wont"]

def remove_punct(string)
  alpha = ('a'..'z').to_a
  clean_string = ''
  string.downcase!
  string.chars.each_with_index do |char, index|
    next if char =~ /[[:punct:]]/ && (!alpha.include?(string[index + 1]) || !alpha.include?(string[index - 1]))
    clean_string << char
  end
  clean_string
end

def top_3_words(text)
  clean_string = remove_punct(text)
  word_count = clean_string.split.each_with_object(Hash.new(0)) { |word, hash| hash[word] += 1 }
  result = []
  until word_count.empty? || result.size == 3
    max_word = word_count.max_by { |_, v| v }[0]
    result << max_word
    word_count.delete(max_word)
  end
  result
end

p top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words("  //wont won't won't ") ==  ["won't", "wont"]
p top_3_words("  , e   .. ") == ["e"]
p top_3_words("  ...  ") == []
p top_3_words("  '  ") == []
p top_3_words("  '''  ") == []

# refining the call to max_by
def top_3_words(text)
  clean_string = remove_punct(text)
  word_count = clean_string.split.each_with_object(Hash.new(0)) { |word, hash| hash[word] += 1 }
  word_count.max_by(3) { |_, v| v }.map(&:first)
end
