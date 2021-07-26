# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied
# as an argument to the method. You may assume that the argument will always be an odd integer.


# diamond(1)

# *

# diamond(3)

#  *
# ***
#  *

#  diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

def diamonds(n)
  half_n = n / 2
  nxn_grid = []
  
  # making the grid
  (half_n + 1).times { nxn_grid << [" "] * n }
  # changing out spaces for diamonds where appropriate
  nxn_grid.each_with_index do |sub_arr, idx|
    (half_n - idx..half_n + idx).each do |star_index|
      sub_arr[star_index] = '*'
    end
  end
  # creating strings to enable correct output
  top_diamond = nxn_grid.map(&:join)
  bottom_diamond = nxn_grid.map(&:dup).map(&:join)
  bottom_diamond.pop
  
  puts top_diamond
  puts bottom_diamond.reverse
end

diamonds(1)
diamonds(3)
diamonds(9)

# LS way
def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end
