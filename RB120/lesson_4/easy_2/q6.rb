# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you know? How would you call a class method?

# Class methods are prefixed with self, therefore it can be seen that self.manfacturer is a class method
# It can be called directly on the class itself when outside the class definition like so: Television.manufacturer
