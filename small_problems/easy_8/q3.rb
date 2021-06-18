# Write a method that returns a list of all the substrings of a string
# that start at the beginning of the original string. The return value
# should be arranged in order from shortest to longest substring.

def leading_substrings(string)
  substring_arr = []
  counter = 1
  loop do
    substring_arr << string.slice(0, counter)
    counter += 1
    break if substring_arr.size == string.size
  end
  substring_arr
end

leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# using upto as the method

def leading_substrings(string)
  substring_arr = []
  1.upto(string.size) do |count|
    substring_arr << string.slice(0, count)
  end
  substring_arr
end
