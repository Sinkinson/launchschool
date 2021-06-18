# write a method that takes a string of digits
# have it return the appropriate number as an integer
# You cannot use any of the standard conversion methods

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |element| DIGITS[element] }
  
  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

# test cases
string_to_integer('4321') == 4321
string_to_integer('570') == 570

# Could just use the join method on the digits array
# in the second half of the method but the above shows
# how we could go about it without this method
