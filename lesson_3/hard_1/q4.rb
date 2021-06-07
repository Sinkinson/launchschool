# Review the following code. It is a method to determine
# if an input is an IP address representing dot seperated numbers.
# Make it return a false condition when there are more or fewer 
# than 4 components to the IP address and when it is not a number
# e.g. ("4.5.5" or "1.2.3.4.5" should be invalid) 
# The is_an_ip_number? method determines if a string is a numeric
# string between 0 and 225

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

# solution

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end
