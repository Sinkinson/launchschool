# A 3 x 3 matrix can be represented by an Array of Arrays in which the main Array and all of the sub-Arrays has 3 elements. For example:

# 1  5  8
# 4  7  2
# 3  9  6

# can be described by the Array of Arrays:

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# The transpose of a 3 x 3 matrix is the matrix that results from exchanging the columns and matrixs of the original matrix.
# For example, the transposition of the array shown above is:

# 1  4  3
# 5  7  9
# 8  2  6

# Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix. Note
# that there is a Array#transpose method that does this -- you may not use it for this exercise. You also are not allowed
# to use the Matrix class from the standard library. Your task is to do this yourself.

# Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix unchanged.

# Examples

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

def transpose(matrix)
  result = Array.new
  3.times { result << [] }
  matrix.each do |matrix|
    matrix.each_with_index { |value, idx| result[idx] << value }
  end
  result
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# option 2
def transpose(matrix)
  result = []
  (0..2).each do |column_index|
    new_matrix = (0..2).map { |matrix_index| matrix[matrix_index][column_index] }
    result << new_matrix
  end
  result
end

# Further exploration

# Write a transpose! method that transposes a matrix in place. The obvious solution is to reuse transpose from above,
# then copy the results back into the array specified by the argument. For this method, don't use this approach; write
# a method from scratch that does the in-place transpose.

# option 1
def transpose!(matrix)
  matrix.each do |row|
    row.each_with_index do |value, idx|
      next if idx > 2
      matrix[idx] << value
    end
  end
  3.times { matrix.each { |row| row.shift } }
  matrix
end

# option 2
def transpose!(matrix)
  (0..2).each do |idx_1|
    (0..2).each do |idx_2|
      matrix[idx_2] << matrix[idx_1][idx_2]
    end
  end
  3.times { matrix.each { |row| row.shift } }
end

# option 3: more cumbersome though
def transpose!(matrix)
  matrix.each_with_index do |_, idx|
    if idx == 0
      matrix[idx][idx + 1], matrix[idx + 1][idx] = matrix[idx + 1][idx], matrix[idx][idx + 1]
      matrix[idx][idx + 2], matrix[idx + 2][idx] = [matrix[idx + 2][idx], matrix[idx][idx + 2]]
    elsif idx == 1
      matrix[idx][idx + 1], matrix[idx + 1][idx] = [matrix[idx + 1][idx], matrix[idx][idx + 1]]
    end
  end
end

transpose!(matrix)
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
