# Fix the following code so it works properly:

class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = mileage + miles
    mileage = total
  end

  def print_mileage
    puts mileage
  end
end

car = Car.new
car.mileage = 5000
car.increment_mileage(678)
car.print_mileage  # should print 5678

# solution
class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = mileage + miles
    self.mileage = total
  end

  def print_mileage
    puts mileage
  end
end

# The original code just creates a local variable called mileage within the increment_mileage method.
# We need to access the setter method, and to do this we need to provide an explicit caller, we do this
# by using self inside an instance method which refers to the object.
# It is always safer to call the setter method by using self rather than referring to the instance variable
# directly as the setter might have a custom piece of code, example below

def mileage=(miles)
  @mileage = miles.to_i
end
