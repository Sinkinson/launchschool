# Building on the prior vehicles question, we now must also track a basic motorboat. A motorboat has a single propeller and hull, but
# otherwise behaves similar to a catamaran. Therefore, creators of Motorboat instances don't need to specify number of hulls or
# propellers. How would you modify the vehicles code to incorporate a new Motorboat class?

# We can create a new class to present the common elements of motorboats and catamarans

module Moveable
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Seacraft
  include Moveable

  attr_reader :hull_count, :propeller_count

  def initialize(num_propellers, num_hulls, fuel_efficiency, fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    self.fuel_efficiency = fuel_efficiency
    self.fuel_capacity = fuel_capacity
  end
end

class Catamaran < Seacraft
end

class Motorboat < Seacraft
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    # set up 1 hull and 1 propeller
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end
