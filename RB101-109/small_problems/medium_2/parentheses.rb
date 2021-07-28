# Write a method that takes a string as an argument, and returns true if all parentheses
# in the string are properly balanced, false otherwise. To be properly balanced, parentheses
# must occur in matching '(' and ')' pairs.

def balanced?(string)
  paren_arr = string.scan(/[()]/)
  return true if paren_arr.empty?
  paren_arr.count('(') == paren_arr.count(')') && paren_arr.last == ')'
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

# LS way
def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end

# increments a variable 1 up or 1 down depending on the char
# returns true if the variable is 0 at the end false otherwise
