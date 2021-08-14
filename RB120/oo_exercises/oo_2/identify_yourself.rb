# Using the following code, add a method named #identify that returns its calling object.

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

kitty = Cat.new('Sophie')
p kitty.identify

# Expected output
#<Cat:0x007ffcea0661b8 @name="Sophie">

# Solution
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def identify
    self
  end

end

kitty = Cat.new('Sophie')
p kitty.identify
