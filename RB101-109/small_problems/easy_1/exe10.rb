# Write a method that takes two arguments - positive integer and boolean
# Have it calculate the bonus for a given salary
# if the boolean is true, the bonus should be half of the salary
# if false the bonus should be zero

# define a method(integer, boolean)
# - if boolean == true
#   - integer / 2
# - else
#   - 0
# can this be compacted into ternary?

def calculate_bonus(int, boolean)
  boolean == true ? (int / 2) : 0
end

# test cases
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000