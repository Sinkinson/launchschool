# In this kata, you have to count lowercase letters in a given string and return the
# letter count in a hash with 'letter' as key and count as 'value'. The key must
# be 'symbol' instead of string in Ruby.

def letter_count(str)
  letter_count = Hash.new(0)
  lowercase_chars = str.chars.select { |char| char == char.downcase }
  lowercase_chars.each { |char| letter_count[char.to_sym] += 1 }
  letter_count
end

p letter_count('codewars')
p letter_count('activity')
p letter_count('arithmetics')
