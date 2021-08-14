# Using the code from what_are_you, add a parameter to #initialize that provides a name for the Cat object.
# Use an instance variable to print a greeting with the provided name. (You can remove the code that displays I'm a cat!.)

class Cat
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello my name is #{@name}!"
  end
end

kitty = Cat.new("Sophie")
kitty.greet
