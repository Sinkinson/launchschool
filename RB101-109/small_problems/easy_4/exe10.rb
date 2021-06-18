# Write a method that takes an integer and converts it to a string
# but is also able to handle negative numbers
# you cannot use any of the standard conversion methods

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

def signed_integer_to_string(integer)
  if integer < 0
    integer_to_string(integer * -1).prepend('-')
  elsif integer > 0
    integer_to_string(integer).prepend('+')
  else
    integer_to_string(integer)
  end
end

# LS way

# def signed_integer_to_string(number)
#   case number <=> 0
#   when -1 then "-#{integer_to_string(-number)}"
#   when +1 then "+#{integer_to_string(number)}"
#   else         integer_to_string(number)
#   end
# end

# in the above example, if the number is negative we append
# a negative sign to it before passing it through the integer_to_string
# method, so we're essentially passing in (--) creating a positive return
# which we can then add '-' to

# even more concise version

# def signed_integer_to_string(number)
#   return '0' if number == 0

#   sign = number < 0 ? '-' : '+'
#   number *= (-1) if sign == '-'

#   sign + integer_to_string(number)
# end

# in this example we first ask if the number is less than zero
# and provide the variable sign a value based on that evaluation
# if the number is less than 0 then we times it by negative 1
# to get a positive number, we then send the number to the
# integer_to_string method and append it with the correct sign

# test cases
p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
