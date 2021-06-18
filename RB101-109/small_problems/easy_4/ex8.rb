# Extend the method in ex7 to work with signed numbers
# write a method that takes a string of digits and returns
# the appropriate number as an integer
# if string appended with + or - this should be translated
# into a positive or negative integer output

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

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

# could refactor the second method to the following:
#   normal_int = string_to_integer(string.delete('+-'))
#   string[0] == '-' ? -normal_int : normal_int

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
