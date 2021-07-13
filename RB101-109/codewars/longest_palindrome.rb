# Find the length of the longest substring in the given string that is the same in reverse
# As an example, if the longest input was "I like racecars that go fast", the substring racecar
# length would be 7
# If the length of the input string is 0, return value must be 0

# Example:
# "a" -> 1
# "aab" -> 2
# "abcde" -> 1
# "zzbaabcd" -> 4
# "" -> 0

def palindromes(substrings)
  substrings.select { |substring| substring.reverse == substring }
end

def longest_palindrome(string)
substrings = []
(0..string.length).each do |start|
  (1..string.length - start).each do |length|
    substrings << string[start, length]
  end
end

palindromes(substrings).max_by(&:size).size
end

p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9
