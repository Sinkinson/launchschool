# Using the following code, add an instance method name #rename that renames the kitty when invoked

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(new_name)
    self.name = new_name
  end

end

kitty = Cat.new('Sophie')
p kitty.name
kitty.rename('Chloe')
p kitty.name

# Because we already have a setter method due to the attr_accessor we don't need to use the instance variable directly in the rename method.
# Instead we can use the setter method. We call the setter method on self which represents the object inside an instance method, if we just used 'name = new_name'
# we would be initialising a new local variable.
