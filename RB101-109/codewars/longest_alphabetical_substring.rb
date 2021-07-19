# Find the longest substring in alphabetical order.
# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
# There are tests with strings up to 10 000 characters long so your code will need to be efficient.
# The input will only consist of lowercase characters and will be at least one letter long.
# If there are multiple solutions, return the one that appears first.

def longest(s)
  substrings = []
  (0..s.size - 1).each do |idx1|
    (idx1..s.size - 1).each do |idx2|
      substrings << s[idx1..idx2] if s[idx1..idx2].chars == s[idx1..idx2].chars.sort
    end
  end
  substrings.max_by(&:size)
end

p longest('asd')
p longest('nab')
p longest('abcdeapbcdef')
p longest('asdfaaaabbbbcttavvfffffdf')
p longest('asdfbyfgiklag')
p longest('z')
p longest('zyba')

# using the slice_when method
def longest(str)
  str.chars.slice_when { |a, b| a > b }
           .max_by(&:size)
           .join
end

# the string is firstly broken to an array of its characters and then the slice_when method is used,
# this splits the array into sub-arrays every time the current element is greater than the next
# the max_by method is then used to get the longest sub-array by size and finally joined to create string
