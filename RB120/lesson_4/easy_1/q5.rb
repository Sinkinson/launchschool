# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# The Pizza class has an instance variable as you can see it defined with the single @ symbol
# In order to check this we can call the instance_variables method on a object of the class

pizza = Pizza.new('pepperoni')
p pizza.instance_variables    # => [:@name]
