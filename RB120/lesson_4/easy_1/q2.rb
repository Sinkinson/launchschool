# If we have a Car class and a Truck class and we want to be able to go_fast, how can we add the ability for them to go_fast
# using the module Speed? How can you check if your Car or Truck can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

# You can include the module in both the Car and Truck class.

class Car
  include Speed
  # rest of code omitted for brevity
end

class Truck
  include Speed
  # rest of code omitted for brevity
end

# You can then test to see if they have access to this method by calling in on an object instantiated from each class

Car.new.go_fast # => I am a Car and going super fast!
Truck.new.go_fast # => I am a Truck and going super fast!

# Can also assign the Car and Truck objects to a variable and then call the method on that

small_car = Car.new
small_car.go_fast # => I am a Car and going super fast!

blue_truck = Truck.new
blue_truck.go_fast # => I am a Truck and going super fast!
