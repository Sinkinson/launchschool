# Write a class that will display
ABC
xyz

# When the following code is run
my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')

# solution
class Transform
  def initialize(str)
    @str = str
  end

  def uppercase
    @str.upcase
  end

  def self.lowercase(str)
    str.downcase
  end
end
