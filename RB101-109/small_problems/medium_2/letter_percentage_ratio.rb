# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as
# characters that were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters
# in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of
# characters that are neither.

# You may assume that the string will always contain at least one character.

# Examples:
# letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

def letter_percentages(string)
  result = {}
  total_chars = string.chars.size.to_f
  result[:lowercase] = ((string.scan(/[a-z]/).size / total_chars) * 100).round(1)
  result[:uppercase] = ((string.scan(/[A-Z]/).size / total_chars) * 100).round(1) 
  result[:neither] = ((string.scan(/[^a-zA-Z]/).size / total_chars) * 100).round(1)
  result 
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')

# LS way
def letter_percentages(string)
  counts = {}
  percentages = {}
  characters = string.chars
  length = string.length

  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end
