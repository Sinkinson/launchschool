# The goal of this exercise is to convert a string to a new string where each character in the new string
# is "(" if that character appears only once in the original string, or ")" if that character appears more
# than once in the original string. Ignore capitalization when determining if a character is a duplicate.

def duplicate_encode(word)
  result = ''
  word.downcase!

  word.chars.each do |char|
    word.count(char) < 2 ? result << '(' : result << ')'
  end

  result
end

p duplicate_encode("din")
p duplicate_encode("recede")
p duplicate_encode("Success")
p duplicate_encode("(( @")
