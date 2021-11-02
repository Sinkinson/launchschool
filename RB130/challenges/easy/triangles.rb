# Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

# Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than the length of the third side.

class Triangle
  attr_reader :sides

  def initialize(*sides)
    @sides = sides
    raise ArgumentError.new unless valid?
  end

  def kind
    return 'equilateral' if @sides.uniq.size == 1
    return 'isosceles' if @sides.uniq.size == 2
    'scalene'
  end

  private

  def valid?
    return false if sides.any?(&:zero?)
    return false if sides.min(2).sum <= sides.max
    return false if sides.any?(&:negative?)
    true
  end
end

# option 2
class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError.new "Invalid triangle lengths" unless valid?
  end

  def kind
    if sides.uniq.size == 1
      'equilateral'
    elsif sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def valid?
    sides.min > 0 &&
    sides[0] + sides[1] > sides[2] &&
    sides[1] + sides[2] > sides[0] &&
    sides[0] + sides[2] > sides[1]
  end
end
