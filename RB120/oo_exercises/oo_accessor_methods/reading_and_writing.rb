# Add the appropriate accessor method to the following code

class Person
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name # -> Jessica

# solution 1
class Person
  attr_accessor :name
end

# solution 2
class Person
  attr_reader :name
  attr_writer :name
end
