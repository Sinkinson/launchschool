# Create a module named Transportation that contains three classes: Vehicle, Truck, and Car. Truck and Car should both inherit from Vehicle.

module Transportation

  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end

end

# Modules are not only useful for grouping common methods together but also for namespacing. This is where similar classes are grouped in a module.
# Grouping classes in a module can also help avoid collision with classes of the same name

# We can instantiate a class thats contained in a module by invoking the following
Transportation::Truck.new
