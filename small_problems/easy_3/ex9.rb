# Write another method that returns true if the string passed
# as an argument is a palindrome, false otherwise.
# This time, the method should be case insensitive and ignore all
# non-alphanumeric characters.
# You can call on the plaindrome method from the previous exercise

def palindrome?(string)
  string == string.reverse
end

def real_palindrome?(arg)
  filtered_arg = arg.downcase.delete('^a-z0-9')
  p palindrome?(filtered_arg)
end

# The end of line 17 could also be replaced with .gsub(/\W/, '')

# test cases
real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false