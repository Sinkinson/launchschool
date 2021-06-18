# Write a method that takes a string and returns a new string in which every
# character is doubled

def repeater(string)
  doubled_string = ''
  string.chars.each { |char| doubled_string << char * 2 }
  doubled_string
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

# LS way

def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end
