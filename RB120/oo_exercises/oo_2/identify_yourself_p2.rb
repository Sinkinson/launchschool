# Update the following code so that it prints I'm Sophie! when it invokes puts kitty.

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

kitty = Cat.new('Sophie')
puts kitty

# solution

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty

# every class has a to_s method, puts calls to_s for every argument it gets passed to conver the value to the appropriate string representation
