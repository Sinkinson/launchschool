# Write a method that returns a list of all the substrings of a string that are palindromic
# That is, each substring must consist of the same sequence of characters forward as it does
# backwards. The return value should be arrange in the same sequence as the substrings appear
# in the string. Duplicate palindromes should be included multiple times.
# You can use the substrings method you used in the previous exercise

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

def palindromes(string)
  palindrome_arr = substrings(string).select do |word| # here we are iterating through the entire colletion of substrings returned by the substrings method
    word.reverse == word if word.size > 1
  end
  palindrome_arr
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# LS way

def palindromes(string)
  all_substrings = substrings(string)
  results = []
  all_substrings.each do |substring|
    results << substring if palindrome?(substring)
  end
  results
end

def palindrome?(string)
  string == string.reverse && string.size > 1
end

# if we were to ignore case and all non-alphanumeric characters we could add this to the leading substrings method

def leading_substrings(string)
  substring_arr = []
  string = string.downcase.gsub(/[^0-9a-z ]/i, '')
  1.upto(string.size) do |count|
    substring_arr << string.slice(0, count)
  end
  substring_arr
end
