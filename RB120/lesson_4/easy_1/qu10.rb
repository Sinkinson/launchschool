# If we have the class below, what would you need to call to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# You would need to call the new method on the class name with two arguments passed in.

brown_bag = Bag.new('Brown', 'Leather')
