# Consider the following class definition:

class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# There is nothing technically incorrect about this class, but the definition may lead
# to problems in the future. How can this class be fixed to be resistant to future problems?

# solution
class Flight
  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# There is no need to provide access to the database_handle. If someone uses that variable
# in real code, future modifications to the class could break that code.
