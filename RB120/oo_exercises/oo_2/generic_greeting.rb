# Modify the following code so that Hello! I'm a cat! is printed when Cat.generic_greeting is invoked.

class Cat
end

Cat.generic_greeting

# Expected output
# Hello! I'm a cat!

# Solution
class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat"
  end
end

Cat.generic_greeting

# The first thing that should be noticed is that the invocation of the method is on the class itself, therefore indicating it is a class method.
# Class methods are prepended with self in the class definition

# Because self references the class when inside a class method we could also write it like this:
class Cat
  def self.generic_greeting
    puts "Hello! I'm a #{self}"
  end
end
