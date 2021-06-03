# Write a method that takes on argument, a positive integer
# have it return a sum of its digits

 def sum(integer)
   arr = integer.to_s.split(//)
   int_arr = arr.map(&:to_i)
   int_arr.inject(:+)
 end

# could refactor this even further, but makes it less readable
# def sum(integer)
#   p integer.to_s.split(//).map(&:to_i).inject(:+)
# end

# test cases
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45