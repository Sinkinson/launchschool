# In this simple Kata your task is to create a function that turns a string into a Mexican Wave.
# You will be passed a string and you must return that string in an array where an uppercase
# letter is a person standing up.

# 1.  The input string will always be lower case but maybe empty.
# 2.  If the character in the string is whitespace then pass over it as if it was an empty seat

# example:
# wave("hello") => ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

def wave(str)
  result = []
  (0..str.length - 1).each do |idx|
    next if str[idx] == ' '
    idx == 0 ? result << str.capitalize : result << one_letter_cap(str, idx)
  end
  result
end

def one_letter_cap(str, idx)
  str[0..idx - 1] + str[idx].upcase + str[idx + 1..-1]
end

p wave("hello")
p wave("two words")
p wave(" gap ")

# Option 2
def wave(str)
  result = []
  chars = str.downcase.chars
  chars.each_with_index do |char, idx|
    next if char == " "
    result << str[0...idx] + char.upcase + str[idx+1..-1]
  end
  result
end

# use ... to go to the index but to not include it
