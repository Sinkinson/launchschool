# Using the following code, create two classes - Truck and Car - that both inherit from Vehicle.

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
end

class Car < Vehicle
end


truck1 = Truck.new(1994)
puts truck1.year

car1 = Car.new(2006)
puts car1.year

# Here the classes Truck and Car inherit @year from Vehicle and because they don't have their own initialize methods, they use
# the initialize method in the superclass
