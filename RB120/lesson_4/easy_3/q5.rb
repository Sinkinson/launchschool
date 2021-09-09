# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer            # NoMethodError
tv.model                   # Would display the model

Television.manufacturer    # Would display the manufacturer
Television.model           # NoMethodError

# You cannot call class methods on instances of the class as they only exist for the class
# Same goes for instance methods and calling them on the class, they have been defined for use
# on objects instantiated from the class not the class itself
