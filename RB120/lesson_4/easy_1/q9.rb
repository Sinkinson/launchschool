# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# In the name of the cats_count method we have used self. What does self refer to in this context?

# self here references the class itself. Outside an instance method within the class definiton self is
# referencing the class. So you could call Cat.cats_count
