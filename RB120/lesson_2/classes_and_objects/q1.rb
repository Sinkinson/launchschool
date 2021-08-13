# Given the below usage of the person class, code the class definition

bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
bob.name                  # => 'Robert'

# class definition

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end
