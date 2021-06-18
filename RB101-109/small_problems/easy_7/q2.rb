# Write a method that takes a string and then returns a hash that contains 3 entries:
# one represents the number of characters in the string that are lower case letters
# one the number that are uppercase letters
# and one the number of characters that are neither



def letter_case_count(string)
  count_hash = Hash.new(0)

  count_hash[:lowercase] = string.scan(/[a-z]/).length
  count_hash[:uppercase] = string.scan(/[A-Z]/).length
  count_hash[:neither] = string.scan(/[^a-zA-Z]/).length

  count_hash
end

# test cases
p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# LS way

UPPERCASE_CHARS = ('A'..'Z').to_a
LOWERCASE_CHARS = ('a'..'z').to_a

def letter_case_count(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }

  string.chars.each do |char|
    if UPPERCASE_CHARS.include?(char)
      counts[:uppercase] += 1
    elsif LOWERCASE_CHARS.include?(char)
      counts[:lowercase] += 1
    else
      counts[:neither] += 1
    end
  end

  counts
end

# another possible solution

def letter_case_count(string)
  counts = {}
  characters = string.chars # breaks each string down into an array of characters
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end

# iterate through the characters array using count method. This counts
# all the characters that meet the criteria given in the block.
# So we use a regexp and the =~ operator to see which characters match
