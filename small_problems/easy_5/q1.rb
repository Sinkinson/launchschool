# write a method that determines and returns the ASCII string value of a string that is passed in as an argument
# the ASCII string value is the sum of the ASCII values of every character in the string
# you can use String#ord to determine the ASCII value of the character

def ascii_value(string)
  string == '' ? 0 : string.chars.map(&:ord).inject(:+)
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# LS way

def ascii_value(string)
  sum = 0
  string.each_char { |char| sum += char.ord }
  sum
end

# initialise sum to zero in case of empty string
# add string.ord to sum for every character

# further exploration

# char.ord.chr == char
# chr method returns a string containing the character represented by the int's value in the ascii table
