# Given a non-empty string check if it can be constructed by taking a substring of it
# and appending multiple copies of the substring together. You may assume the given string
# consists of lowercase English letters only

def repeated_substring_pattern(string)
  substring = ''
  index = 0
  
  loop do
    multiplier = 2
    substring << string[index]
    loop do
      break if multiplier == (string.length / 2) + 1
      return true if substring * multiplier == string
      multiplier += 1
    end
    return false if substring.length == string.length 
    index += 1
  end
end

# Test cases
p repeated_substring_pattern("abab")
p repeated_substring_pattern("aba")
p repeated_substring_pattern("aabaaba")
p repeated_substring_pattern("abaababaab")
p repeated_substring_pattern("abcabcabcabc")

# Better solution
# Only multiplies substrings by multiples of original string
# Extracts substrings into array first

def repeated_substring_pattern(string)
  substrings = []
  1.upto(string.size / 2) do |substring_length|
    if string.size % substring_length == 0
      substrings << string[0, substring_length]
    end
  end

  substrings.each do |substring|
    multiplier = string.size / substring.size
    return true if substring * multiplier == string
  end

  false
end
