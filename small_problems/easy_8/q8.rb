# Write a method that takes a string and returns a new string in which
# every consonant character is doubled

def double_consonants(string)
  doubled_string = ''
  string.chars.each do |char|
    if char =~ (/[a-z]/i) && char =~ (/[^'aeiou']/i)
      doubled_string << char * 2
    else
      doubled_string << char
    end
  end
  doubled_string
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

# LS way

CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end
