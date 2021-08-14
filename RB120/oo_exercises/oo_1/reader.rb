# Using the code from hello_sophie, add a getter method named #name and invoke it in place of @name in #greet

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet

# another option
class Cat
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

# Getter methods also allow us to invoke the method outside the class definition like this kitty.name # -> Sophie
