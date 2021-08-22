# Correct the following program so it will work properly. Assume that the Car class has a complete
# implementation; just make the smallest possible change to ensure that cars have access to the drive method.

module Drivable
  def self.drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive

# solution
module Drivable
  def drive
  end
end

class Car
  include Drivable
end

# Methods in mixin modules should be defined without using self. If you add self the including class will only be able
# to access the method using Drivable.drive and it will not be available as an instance method to objects.
