# Write a method that takes one argument, a positive integer,
# have it return a string of alternating 1's and 0's, starting with 1.
# The length of the string should match the given integer


def stringy(num)
  "".rjust(num, '10')
end


# test cases
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# LS way

# def stringy(size)
#   numbers = []

#   size.times do |index|
#     number = index.even? ? 1 : 0
#     numbers << number
#   end

#   numbers.join
# end

