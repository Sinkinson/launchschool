# write a method that returns true if the string passed as an argument is a palindrome
# false otherwise
# a palindrome reads the same forward and backward
# case matters as does punctuation and spaces

def palindrome?(string)
  string == string.reverse
end

# the above also works for arrays
# test cases
palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true
