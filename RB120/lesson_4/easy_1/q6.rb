# What could we add to the class below to access the instance variable @volume?

class Cube
  def initialize(volume)
    @volume = volume
  end
end

# We could add a getter method in order to access the instance variable

# option 1
class Cube
  attr_reader :volume
  
  def initialize(volume)
    @volume = volume
  end
end

# option 2
class Cube
  def initialize(volume)
    @volume = volume
  end

  def volume
    @volume
  end
end

# And if the instance variable had been assigned a value we could also just use the instance_variable_get method

big_cube = Cube.new(5000)
big_cube.instance_variable_get("@volume")
# => 5000
