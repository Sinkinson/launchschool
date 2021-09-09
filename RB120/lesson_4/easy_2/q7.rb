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

# Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

# @@cats_count is a class variable so all instances of the class will share the same copy. Here it is keeping track of
# how many instances of the class have been instantiated. It adds one every time the initialize method is called, which
# happens automatically when a new object is instantiated. So if you instantiated two instances and then called the
# cats_count method on the class it will return the class variable which now has a value equal to 2. See example below

Cat.new('black')
Cat.new('white')

puts Cat.cats_count # => 2
