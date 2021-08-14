# Using the code from #reader add a setter method name #name=
# Then rename kitty to Luna and invoke greet again

class Cat
  attr_reader :name
  attr_writer :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = "Luna"
kitty.greet

# Expected output
# Hello! My name is Sophie!
# Hello! My name is Luna!

# another option
def name=(name)
  @name = name
end
