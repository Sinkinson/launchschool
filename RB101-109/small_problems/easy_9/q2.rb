# a double number is a number with an even number of digits whose left-side digits are exactly the
# same as its right-side digits. For example 44, 3333, 103103, 7676 are all double numbers
# 444,334433, and 107 are not.
# Write a method that returns 2 times the number provided as an argument, unless the argument is a
# double number, they should be returned as-is

def double_number?(integer)
  middle = integer.to_s.size / 2
  string_int = integer.to_s
  string_num = string_int.slice!(0, middle)
  string_int == string_num
end

def twice(integer)
  double_number?(integer) ? integer : integer * 2 
end

#test cases
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

# LS way

def twice(number)
  string_number = number.to_s
  center = string_number.size / 2
  left_side = center.zero? ? '' : string_number[0..center - 1]
  right_side = string_number[center..-1]

  return number if left_side == right_side
  return number * 2
end

# on line 35 is carrying out a check for single digit characters.
# we achieved the same with the mutating version of slice
