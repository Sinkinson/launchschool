# write a method that takes a positive integer or zero and converts it to a string
# you cannot use any of the usual methods to do this

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

# In line 10 prepend is similar to unshift but 
# for a string. It is also destructive.
# We are also retrieving the value by index in
# line 10 so it's the same as DIGITS[5] for example

# test cases
p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
