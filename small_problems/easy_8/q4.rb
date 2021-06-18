# Write a method that returns a list of all the substrings of a string
# you should use the leading strings method from the previous exercise

def substrings(string)
  sub_arr = []
  until string.chars.empty?
    sub_arr << leading_substrings(string)
    string.slice!(0)
  end
  sub_arr.flatten
end

def leading_substrings(string)
  substring_arr = []
  1.upto(string.size) do |count|
    substring_arr << string.slice(0, count)
  end
  substring_arr
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

# LS way

def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(leading_substrings(this_substring))
  end
  results
end
