# Write a method that takes one argument, 
# a positive integer, and returns a list 
# of the digits in the number.

def digit_list(numbers)
  numbers.to_s.split(//).map { |num| num.to_i }
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

=begin 

LS way 

def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

Because only the to_i method needed to be peformed in the 
block we could have just passed that into map as an argument.
Chars achieves the same as split but is more robust so is the
better option of the two.ar