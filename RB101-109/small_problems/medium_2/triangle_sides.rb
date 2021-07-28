# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater
# than the length of the longest side, and all sides must have lengths greater than 0: if either
# of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a 
# ymbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is
# equilateral, isosceles, scalene, or invalid.

def triangle(side1, side2, side3)
  tri_arr = [side1, side2, side3]
  return :invalid if tri_arr.any?(&:zero?)
  return :equilateral if tri_arr.all? { |sides| sides == tri_arr[0] }
  return :invalid if tri_arr.min(2).sum < tri_arr.max
  return :scalene if tri_arr.uniq == tri_arr
  :isosceles
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

# LS way
def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  largest_side = sides.max

  case
  when 2 * largest_side > sides.reduce(:+), sides.include?(0)
    :invalid
  when side1 == side2 && side2 == side3
    :equilateral
  when side1 == side2 || side1 == side3 || side2 == side3
    :isosceles
  else
    :scalene
  end
end
