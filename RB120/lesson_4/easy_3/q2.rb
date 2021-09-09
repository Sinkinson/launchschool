# In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# If we call Hello.hi we get an error message. How would you fix this?

class Hello < Greeting
  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end

# We firstly need to make the hi method a class method to ensure hi can be called on the class directly. We do this by prefixing self.
# Then we can't just call greet within the method because the Greeting class itself only defines greet on its instances, so we therefore
# need to create a greeting instance in which we can call the method on. We could have also just created an instance of Hello and done
# the same.
