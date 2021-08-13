# Using the class definition from step 3, create a few more person objects
# If we're trying to determine whether two objects contain the same name, how can we compare the two objects?

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name == rob.name

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"  # The person's name is: #<Person:0x00007f952714c738>

# we see the output of the last line like this because to_s is called directly on the object
