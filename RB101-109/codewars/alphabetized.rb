# Re-order the characters of a string, so that they are concatenated into a new string in
# "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and punctuation
# shall simply be removed! The input is restricted to contain no numerals and only words
# containing the english alphabet letters.

# Example: alphabetized("The Holy Bible") # "BbeehHilloTy"

def alphabetized(s)
  s.gsub!(/[^a-zA-Z]/, '')
  s.chars.sort { |a, b| a.downcase <=> b.downcase }.join
end

p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a") == "AabB"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"
