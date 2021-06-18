# Write a method that takes a positive integer, n, as an argument.
# Have it display a right triangle whose sides each have n stars.
# The hypotenuse of the triangle should have one end at the lower left
# and the other end at the upper right

def triangle(integer)
  counter = 1
  dup = integer
  
  loop do
    puts (" " * dup) + ('*' * counter)
    dup -= 1
    counter += 1
    break if counter > integer
  end
end


# test cases
triangle(5)

#     *
#    **
#   ***
#  ****
# *****

triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

# LS way

def triangle(num)
  spaces = num - 1
  stars = 1

  num.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end
